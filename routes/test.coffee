module.exports = (socketIoPort) ->
  routes = {}
  routes.testClient = (request, response) ->
    protocol = request.protocol
    host = request.headers.host
    hostname = if host.indexOf(':') == -1
      host
    else
      host[0..host.indexOf(':')-1]
    response.render 'test-client',
      host: "#{protocol}://#{hostname}:#{socketIoPort}"

  routes