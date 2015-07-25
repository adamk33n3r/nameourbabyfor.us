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
    controller: 'CampaignListController'
    data:
      css: 'app/routes/campaign/campaign.css'
  .state 'campaign.new',
    url: '/new'
    templateUrl: 'app/routes/campaign/views/campaign-new.html'
    controller: 'CampaignNewController'
  .state 'campaign.show',
    url: '/:id'
    templateUrl: 'app/routes/campaign/views/campaign-show.html'
    controller: 'CampaignShowController'
  .state 'campaign.edit',
    url: '/:id/edit'
    templateUrl: 'app/routes/campaign/views/campaign-edit.html'
    # controller: 'CampaignController'
  .state 'campaign.vote',
    url: '/:id/vote'
    templateUrl: 'app/routes/campaign/views/campaign-vote.html'
    controller: 'CampaignVoteController'
  .state 'campaign.results',
    url: '/:id/results'
    templateUrl: 'app/routes/campaign/views/campaign-results.html'
    controller: 'CampaignResultsController'
