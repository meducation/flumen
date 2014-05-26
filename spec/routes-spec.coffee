Routes = require '../routes'

describe 'Routes', ->
  routes = null

  emitSpy = jasmine.createSpy()
  fakeSocketIoApp =
    sockets:
      emit: jasmine.createSpy()
      in: ->
        emit: emitSpy

  fakeResponse =
    send: ->

  beforeEach ->
    routes = Routes fakeSocketIoApp

  it 'should emit the correct event when receiving a news feed item', ->
    fakeRequest =
      body:
        type: 'news_feed_item'
        payload: '{"id" : 1}'

    routes.index fakeRequest, fakeResponse

    expect(fakeSocketIoApp.sockets.emit)
      .toHaveBeenCalledWith 'news-feed-item', id: 1

  it 'should emit the correct event when receiving a created notification', ->
    fakeRequest =
      body:
        type: 'notification'
        action: 'created'
        payload: '{"id" : 1, "user_id": 2}'

    routes.index fakeRequest, fakeResponse

    expect(emitSpy)
      .toHaveBeenCalledWith 'notification-created', {id: 1, user_id: 2}

  it 'should emit the correct event when receiving a read notification', ->
    fakeRequest =
      body:
        type: 'notification'
        action: 'read'
        payload: '{"id" : 1, "user_id": 2}'

    routes.index fakeRequest, fakeResponse

    expect(emitSpy)
      .toHaveBeenCalledWith 'notification-read', {id: 1, user_id: 2}

  it 'should emit the event to the correct user', ->
    spyOn(fakeSocketIoApp.sockets, 'in').andCallThrough()

    fakeRequest =
      body:
        type: 'notification'
        action: 'read'
        payload: '{"id" : 3, "user_id": 4}'

    routes.index fakeRequest, fakeResponse

    expect(fakeSocketIoApp.sockets.in).toHaveBeenCalledWith 4

  it 'should emit the correct event when receiving a created message', ->
    fakeRequest =
      body:
        type: 'message'
        action: 'created'
        payload: '{"id" : 1, "user_id": 2}'

    routes.index fakeRequest, fakeResponse

    expect(emitSpy)
      .toHaveBeenCalledWith 'message-created', {id: 1, user_id: 2}