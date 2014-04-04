exports.rawBodyParser = (request, response, next) ->
  request.rawBody = ''
  request.setEncoding 'utf8'

  request.on 'data', (chunk) ->
    request.rawBody += chunk

  request.on 'end', ->
    console.log "Received headers: #{JSON.stringify request.headers}"
    console.log "Received raw body: #{request.rawBody}"
    next()