exports.message = (request, response) ->
  json = JSON.parse request.rawBody
  message = JSON.parse json.Message

  request.io.broadcast 'news-feed-item', message
  response.send 200