#!/bin/coffee

request = require 'request'

payload =
  id: 1
  user_id: 3
  item_id: 30297
  item_type: 'MediaFile'
  action: 'item_share_new'

messageCreated =
    type: 'notification'
    action: 'created'
    payload: JSON.stringify payload

messageRead =
  type: 'notification'
  action: 'read'
  payload: JSON.stringify payload

postOptions =
  host: 'http://localhost'
  port: '3004'
  path: '/'
  method: 'POST'
  headers:
    'Content-Type': 'application/json'

request.post {url: 'http://localhost:3004/', json: messageCreated}
request.post {url: 'http://localhost:3004/', json: messageRead}
