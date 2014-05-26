request = require 'supertest'
testRequest = null

describe 'Flumen', ->
  beforeEach ->
    testRequest = request 'http://localhost:3004'

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
        payload: JSON.stringify(newsFeedItem)

      testRequest
        .post('/')
        .set('Content-Type', 'application/json')
        .send(message)
        .expect 200, done

  describe 'POSTing notifications', ->
    it 'should respond successfully', (done) ->
      notification =
        id: 1
        user_id: 2
        item_id: 3
        item_type: 'MediaFile'
        action: 'item_share_new'

      message =
        type: 'notification'
        action: 'created'
        payload: JSON.stringify(notification)

      testRequest
        .post('/')
        .set('Content-Type', 'application/json')
        .send(message)
        .expect 200, done

  describe 'POSTing user inbox messages', ->
    it 'should respond successfully', (done) ->
      user_inbox_message =
        id: 1
        thread_id: 2
        from_id: 3
        parsed_content: 'Foobar'

      message =
        type: 'message'
        action: 'created'
        payload: JSON.stringify(user_inbox_message)

      testRequest
      .post('/')
      .set('Content-Type', 'application/json')
      .send(message)
      .expect 200, done