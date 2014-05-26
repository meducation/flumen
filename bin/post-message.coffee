#!/bin/coffee

request = require 'request'

payload =
  id: 35134
  user_id: 3
  from_id: 2
  thread_id: 31739
  parsed_content: 'Foobar'

messageCreated =
    type: 'message'
    action: 'created'
    payload: JSON.stringify payload

messageUnread =
  type: 'message'
  action: 'unread'
  payload: JSON.stringify payload

postOptions =
  host: 'http://localhost'
  port: '3004'
  path: '/'
  method: 'POST'
  headers:
    'Content-Type': 'application/json'

request.post {url: 'http://localhost:3004/', json: messageCreated}
request.post {url: 'http://localhost:3004/', json: messageUnread}
