'use strict'

angular.module 'nameourbabyforusApp'
.controller 'CampaignShowController', ($scope, $stateParams, Campaign, List) ->
  $scope.id = $stateParams.id
  $scope.campaign = Campaign.get
    id: $stateParams.id

  $scope.mostPopular = ->
    if $scope.campaign.votes?.length > 0
      $scope.campaign.votes.reduce (max, vote) ->
        return if vote.count > max.count then vote else max
    else
      return {
        name: 'none'
        count: 0
      }

  $scope.leastPopular = ->
    if $scope.campaign.votes?.length > 0
      $scope.campaign.votes.reduce (max, vote) ->
        return if vote.count < max.count then vote else max
    else
      return {
        name: 'none'
        count: 0
      }

  $scope.totalVotes = ->
    if $scope.campaign.votes?.length > 0
      if $scope.campaign.votes.length is 1
        return $scope.campaign.votes[0].count
      $scope.campaign.votes.reduce (prev, next) ->
        return if prev.count? then prev.count + next.count else prev + next.count
    else
      return 0

