'use strict'

describe 'Controller: CampaignCtrl', ->

  # load the controller's module
  beforeEach module 'nameourbabyforusApp'
  CampaignCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    CampaignCtrl = $controller 'CampaignCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
