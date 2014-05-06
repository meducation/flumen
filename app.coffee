express = require 'express'
io = require 'socket.io'
http = require 'http'
fs = require 'fs'
path = require 'path'
logger = require 'winston'
routes = require './routes'
testRoutes = require './routes/test'

fs.mkdir './log' unless fs.existsSync './log'
logger.add logger.transports.File,
  filename: './log/flumen.log'
  handleExceptions: true

socketIoPort = 3005
socketIoApp = io.listen socketIoPort
socketIoApp.configure ->
  socketIoApp.set 'browser client minification', true
  socketIoApp.set 'browser client gzip', true
  socketIoApp.set 'browser client etag', true

socketIoRoutes = routes socketIoApp
testClientRoute = testRoutes socketIoPort

socketIoApp.sockets.on 'connection', (socket) ->
  socket.on 'handshake', (data) ->
    socket.join data.user_id
    logger.info "User #{data.user_id} on socket #{socket.id} joined room"

port = process.env.PORT || 3004
webApp = express()
webApp.configure ->
  webApp.set 'port', port
  webApp.use express.logger 'dev'
  webApp.use express.bodyParser()
  webApp.use express.errorHandler()
  webApp.use express.methodOverride()
  webApp.set 'view engine', 'jade'
  webApp.set 'views', __dirname + '/views'

webApp.get '/test', testClientRoute.testClient
webApp.post '/', socketIoRoutes.index

webApp.listen port, ->
  logger.info "Flumen server listening on port #{port}"
