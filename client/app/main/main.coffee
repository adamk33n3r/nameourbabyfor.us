'use strict'

angular.module 'nameourbabyforusApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'app/main/main.html'
    controller: 'MainCtrl'
    data:
      css: 'app/main/main.css'
