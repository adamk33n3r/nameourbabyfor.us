'use strict'

angular.module 'nameourbabyforusApp'
.controller 'CampaignVoteCtrl', ($scope, $state, $stateParams, Auth, Campaign, List) ->
  $scope.campaignID = $stateParams.id
  $scope.voting = true

  $scope.names = [
    '',
    ''
  ]

  $scope.getNames = ->
    Campaign.getNames
      id: $scope.campaignID
    .$promise.then (data) ->
      $scope.names = data
      $scope.voting = false

  $scope.vote = (name) ->
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
  .$promise.then (data) ->
    $scope.getNames()
    List.get
      id: data.list._id
    .$promise.then (data) ->
      $scope.list = data
  , (err) ->
    if err.status is 404
      $state.go '^.list'

