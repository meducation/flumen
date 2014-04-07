logger = require 'winston'

module.exports = (socketIoApp) ->
  routes = {}
  routes.index = (request, response) ->
    message = request.body
    logger.info "Received message: #{JSON.stringify message}"
    switch message.type
      when 'news_feed_item'
        socketIoApp.sockets.emit 'news-feed-item', message.payload

    response.send 200

  routes