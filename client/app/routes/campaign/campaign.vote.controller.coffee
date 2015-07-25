'use strict'

angular.module 'nameourbabyforusApp'
.controller 'CampaignVoteController', ($scope, $state, $stateParams, hotkeys, Auth, Campaign, List) ->
  $scope.campaignID = $stateParams.id
  $scope.voting = true

  $scope.names = [
    '',
    ''
  ]

  hotkeys.bindTo $scope
  .add
    combo: 'left'
    description: 'Vote for name on left'
    callback: ->
      $scope.vote $scope.names.name1
  .add
    combo: 'right'
    description: 'Vote for name on right'
    callback: ->
      $scope.vote $scope.names.name2

  $scope.getNames = ->
    Campaign.getNames
      id: $scope.campaignID
    .$promise.then (data) ->
      $scope.names = data
      $scope.voting = false

  $scope.vote = (name) ->
    return false if $scope.voting
    $scope.voting = true
    console.log "Voting for #{name}..."
    Campaign.vote
      id: $scope.campaignID
    ,
      name: name
    .$promise.then (data) ->
      $scope.getNames()

  Campaign.get
    id: $scope.campaignID
  .$promise.then (campaign) ->
    $scope.campaign = campaign
    $scope.getNames()
    List.get
      id: campaign.list._id
    .$promise.then (list) ->
      $scope.list = list
  , (err) ->
    if err.status is 404
      $state.go '^.list'

