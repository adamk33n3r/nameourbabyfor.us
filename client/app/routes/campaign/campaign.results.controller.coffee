'use strict'

angular.module 'nameourbabyforusApp'
.controller 'CampaignResultsController', ($scope, $stateParams, Campaign) ->
  $scope.id = $stateParams.id

  $scope.pagination = {
    page: 1
    itemsPerPage: 10
    maxSize: 5
    maxSizeMobile: 3
  }


  Campaign.get
    id: $stateParams.id
  .$promise.then (campaign) ->
    $scope.campaign = campaign

  $scope.getFavorites = ->
    if $scope.campaign?.votes?
      vote for vote in $scope.campaign.votes when vote.state is 'favorite'

  $scope.getVetoed = ->
    if $scope.campaign?.votes?
      vote for vote in $scope.campaign.votes when vote.state is 'veto'

  $scope.setState = (vote) ->
    Campaign.setState
      id: $scope.id
    ,
      name: vote.name
      state: vote.state
