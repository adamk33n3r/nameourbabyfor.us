'use strict'

angular.module 'nameourbabyforusApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'campaign',
    url: '/campaign'
    templateUrl: 'app/routes/campaign/views/campaign.html'
  .state 'campaign.index',
    url: '/list'
    views:
      "":
        templateUrl: 'app/routes/campaign/views/campaign-index.html'
        controller: 'CampaignCtrl'
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
