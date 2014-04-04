express = require 'express.io'
http = require 'http'
path = require 'path'
routes = require './routes'
parser = require './lib/parser'

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
  console.log "Flumen server listening on port #{port}"
