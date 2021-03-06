logger = require 'winston'

module.exports = (socketIoApp) ->
  routes = {}
  routes.index = (request, response) ->
    message = request.body
    logger.info "Received message: #{JSON.stringify message}"
    parsedPayload = JSON.parse message.payload
    switch message.type
      when 'news_feed_item'
        socketIoApp.sockets.emit 'news-feed-item', parsedPayload
      when 'notification', 'message'
        userId = parsedPayload.user_id
        socketIoApp.sockets.in(userId)
          .emit "#{message.type}-#{message.action}", parsedPayload

    response.send 200

  routes