express = require 'express.io'
routes = require './routes'
http = require 'http'
path = require 'path'

app = express()

app.set 'port', process.env.PORT || 3000
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'
app.use express.favicon()
app.use express.logger('dev')
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use app.router
app.use express.static(path.join(__dirname, 'public'))

if 'development' == app.get('env')
  app.use express.errorHandler()

app.http().io()

app.get '/', routes.index

port = app.get 'port'
app.listen port, ->
  console.log "Flumen server listening on port #{port}"