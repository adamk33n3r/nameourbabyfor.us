'use strict'

angular.module 'nameourbabyforusApp'
.controller 'CampaignCtrl', ($scope, $state, Campaign) ->
  Campaign.query().$promise.then (campaigns) ->
    for campaign in campaigns
      campaign.created_at = new Date campaign.created_at
    $scope.campaigns = campaigns
