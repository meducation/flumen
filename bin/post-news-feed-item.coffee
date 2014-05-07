#!/bin/coffee

request = require 'request'

payload1 =
  id: 1
  news_type: "item_view"
  user_name: "Ben Paddock"
  about_item_id: 30351
  about_item_type: "MediaFile"
  item_title: "Cardiology in a Heartbeat"
  image_url: "https://d2mzg49w4tz69q.cloudfront.net/users/21465/files/ac5a488e-3a67-6277-703f-648739a63dfa/delivery/img0.jpg"
  icon: "fa-play"
  created_at: "2014-01-02"
  created_at_timestamp: "1395411579"

message1 =
	type: "news_feed_item"
	payload: JSON.stringify payload1

payload2 =
  id: 2
  news_type: "new_comment"
  user_name: "Jeremy Walker"
  about_item_id: 30297
  about_item_type: "MediaFile"
  item_title: "Cranial Nerves - Anatomy Clinical Signs and Study Tips"
  image_url: "https://d2mzg49w4tz69q.cloudfront.net/users/21421/files/d8c45541-1ce9-c892-6661-aae24c066c81/delivery/low_quality_1022x723.jpg"
  icon: "fa-play"
  created_at: "2014-01-01"
  created_at_timestamp: "1396879740"

message2 =
	type: "news_feed_item"
	payload: JSON.stringify payload2

postOptions =
  host: 'http://localhost'
  port: '3004'
  path: '/'
  method: 'POST'
  headers:
    'Content-Type': 'application/json'

request.post {url: 'http://localhost:3004/', json: message1}
request.post {url: 'http://localhost:3004/', json: message2}
