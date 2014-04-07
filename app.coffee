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

webApp = express()
webApp.configure ->
  webApp.set 'port', process.env.PORT || 3004
  webApp.use express.logger 'dev'
  webApp.use express.bodyParser()
  webApp.use express.errorHandler()
  webApp.use express.methodOverride()

webApp.post '/', socketIoRoutes.index

port = webApp.get 'port'
webApp.listen port, ->
  logger.info "Flumen server listening on port #{port}"
