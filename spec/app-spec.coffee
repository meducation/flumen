request = require 'supertest'

describe 'Flumen', ->
  beforeEach ->
    request = request 'http://localhost:3001'

  describe 'POSTing messages', ->
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

      payload =
        Message: JSON.stringify(newsFeedItem)

      request
        .post('/message')
        .set('Accept', 'text/plain')
        .send(JSON.stringify(payload))
        .expect 200, done
