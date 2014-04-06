express = require 'express.io'
http = require 'http'
fs = require 'fs'
path = require 'path'
logger = require 'winston'
routes = require './routes'
parser = require './lib/parser'

fs.mkdir './log' unless fs.existsSync './log'
logger.add logger.transports.File,
  filename: './log/flumen.log'
  handleExceptions: true

app = express()
app.configure ->
  app.set 'port', process.env.PORT || 3001
  # Use a raw body parser to handle SNS messages.
  # They are received as plain/text.
  app.use parser.rawBodyParser
  app.use express.logger('dev')
  app.use express.errorHandler()
  app.use express.methodOverride()

app.http().io()

app.post '/message', routes.message

port = app.get 'port'
app.listen port, ->
  logger.info "Flumen server listening on port #{port}"
