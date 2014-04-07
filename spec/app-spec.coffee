request = require 'supertest'

describe 'Flumen', ->
  beforeEach ->
    request = request 'http://localhost:3004'

  describe 'POSTing news feed items', ->
    it 'should respond successfully', (done) ->
      newsFeedItem =
        id: 1
        news_type: "some-news",
        user_name: "Ben Paddock",
        about_item_id: 2,
        about_item_type: "MediaFile",
        item_title: "Foo",
        image_url: "bar.jpg",
        icon: "fa-play",
        created_at: "2013-04-06"

      message =
        type: 'news_feed_item'
        payload: newsFeedItem

      request
        .post('/')
        .set('Content-Type', 'application/json')
        .send(message)
        .expect 200, done
