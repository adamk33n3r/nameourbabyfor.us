'use strict'

describe 'Service: Campaign', ->

  # load the service's module
  beforeEach module 'nameourbabyforusApp'

  # instantiate service
  Campaign = undefined
  beforeEach inject (_Campaign_) ->
    Campaign = _Campaign_

  it 'should do something', ->
    expect(!!Campaign).toBe true
