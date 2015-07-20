'use strict'

angular.module 'nameourbabyforusApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'campaign',
    url: '/campaigns'
    templateUrl: 'app/routes/campaign/views/campaign.html'
  .state 'campaign.list',
    url: '/list'
    templateUrl: 'app/routes/campaign/views/campaign-list.html'
    controller: 'CampaignCtrl'
    data:
      css: 'app/routes/campaign/campaign.css'
  .state 'campaign.new',
    url: '/new'
    templateUrl: 'app/routes/campaign/views/campaign-new.html'
    controller: 'CampaignNewCtrl'
  .state 'campaign.show',
    url: '/:id'
    templateUrl: 'app/routes/campaign/views/campaign-show.html'
    controller: 'CampaignShowCtrl'
  .state 'campaign.edit',
    url: '/:id/edit'
    templateUrl: 'app/routes/campaign/views/campaign-edit.html'
    # controller: 'CampaignCtrl'
  .state 'campaign.vote',
    url: '/:id/vote'
    templateUrl: 'app/routes/campaign/views/campaign-vote.html'
    controller: 'CampaignVoteCtrl'
