'use strict'

describe 'Service: List', ->

  # load the service's module
  beforeEach module 'nameourbabyforusApp'

  # instantiate service
  List = undefined
  beforeEach inject (_List_) ->
    List = _List_

  it 'should do something', ->
    expect(!!List).toBe true