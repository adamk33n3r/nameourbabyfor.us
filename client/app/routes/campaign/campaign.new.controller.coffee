'use strict'

angular.module 'nameourbabyforusApp'
.controller 'CampaignNewController', ($scope, $state, Auth, Campaign, List) ->
  $scope.nameLists = [
    #name: "Custom"
  ]

  $scope.campaign = {
    name: ''
    list: ''
    gender: 'male'
    saving: false
  }

  List.query().$promise.then (data) ->
    $scope.nameLists = data.sort (i1, i2) ->
      if i1.group is i2.group
        i1.name < i2.name
      else
        i1.group < i2.group
    .concat $scope.nameLists

  $scope.createCampaign = ->
    campaign = $scope.campaign
    uid = Auth.getCurrentUser()._id
    console.log "Creating campaign #{$scope.campaign.name} with the #{$scope.campaign.list.name} list..."
    campaign.saving = true
    Campaign.save
      name: campaign.name
      owned_by: uid
      list: campaign.list._id
      gender: campaign.gender
    .$promise.then (newCampaign) ->
      console.log "Campaign saved."
      $state.go '^.show',
        id: newCampaign._id
    , (err) ->
      console.log "Campaign not created"
      campaign.saving = false
  $scope.isValid = (ele) ->
    return ele.$dirty and  ele.$valid
  $scope.isInvalid = (ele) ->
    return ele.$dirty and ele.$invalid
