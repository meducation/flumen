express = require 'express'
io = require 'socket.io'
http = require 'http'
fs = require 'fs'
path = require 'path'
logger = require 'winston'
routes = require './routes'

fs.mkdir './log' unless fs.existsSync './log'
logger.add logger.transports.File,
  filename: './log/flumen.log'
  handleExceptions: true

socketIoApp = io.listen 3005
socketIoRoutes = routes socketIoApp

port = process.env.PORT || 3004
webApp = express()
webApp.configure ->
  webApp.set 'port', port
  webApp.use express.logger 'dev'
  webApp.use express.bodyParser()
  webApp.use express.errorHandler()
  webApp.use express.methodOverride()
  webApp.set 'views', __dirname + '/views'

webApp.get '/test', (request, response) ->
  response.sendfile 'views/test-client.html'

webApp.post '/', socketIoRoutes.index

webApp.listen port, ->
  logger.info "Flumen server listening on port #{port}"
