logger = require 'winston'

exports.rawBodyParser = (request, response, next) ->
  request.rawBody = ''
  request.setEncoding 'utf8'

  request.on 'data', (chunk) ->
    request.rawBody += chunk

  request.on 'end', ->
    logger.info "Received headers: #{JSON.stringify request.headers}"
    logger.info "Received raw body: #{request.rawBody}"
    next()