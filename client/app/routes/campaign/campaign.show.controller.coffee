'use strict'

angular.module 'nameourbabyforusApp'
.controller 'CampaignShowCtrl', ($scope, $stateParams, Campaign, List) ->
  $scope.id = $stateParams.id
  $scope.campaign = Campaign.get
    id: $stateParams.id

  $scope.mostPopular = ->
    if $scope.campaign.votes
      $scope.campaign.votes.reduce (max, vote) ->
        return if vote.count > max.count then vote else max

  $scope.leastPopular = ->
    if $scope.campaign.votes
      $scope.campaign.votes.reduce (max, vote) ->
        return if vote.count < max.count then vote else max

  $scope.totalVotes = ->
    if $scope.campaign.votes
      $scope.campaign.votes.reduce (prev, next) ->
        return if prev.count? then prev.count + next.count else prev + next.count

