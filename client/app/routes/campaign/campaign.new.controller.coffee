'use strict'

angular.module 'nameourbabyforusApp'
.controller 'CampaignNewCtrl', ($scope, Auth, Campaign, List) ->
  $scope.nameLists = [
    name: "2015"
    group: "Top Names"
  ,
    name: "2014"
    group: "Top Names"
  ,
    name: "Midwest"
    group: "Top Names"
  ,
    name: "Biblical"
    group: "Themed"
  ,
    name: "Custom"
  ]

  $scope.campaign = {
    name: "My First Campaign"
  }

  List.query().$promise.then (data) ->
    $scope.nameLists = data
    $scope.campaign.list = $scope.nameLists[0]

  $scope.createCampaign = ->
    campaign = $scope.campaign
    uid = Auth.getCurrentUser()._id
    console.log "Creating campaign #{$scope.campaign.name} with the #{$scope.campaign.list.name} list..."
    Campaign.save
      name: campaign.name
      owned_by: uid
      list: campaign.list._id
