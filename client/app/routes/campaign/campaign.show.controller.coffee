'use strict'

angular.module 'nameourbabyforusApp'
.controller 'CampaignShowCtrl', ($scope, $stateParams, Campaign, List) ->
  $scope.campaign = Campaign.get
    id: $stateParams.id
