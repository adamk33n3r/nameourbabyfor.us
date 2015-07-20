'use strict'

angular.module 'nameourbabyforusApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'list',
    url: '/lists'
    templateUrl: 'app/routes/list/list.html'
    controller: 'ListCtrl'
    data:
      css: 'app/routes/list/list.css'
  .state 'list-show',
    url: '/lists/:id'
    templateUrl: 'app/routes/list/list-show.html'
    controller: 'ListShowCtrl'
    data:
      css: 'app/routes/list/list.css'
