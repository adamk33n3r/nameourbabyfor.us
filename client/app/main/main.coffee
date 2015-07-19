'use strict'

angular.module 'nameourbabyforusApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    views:
      '':
        templateUrl: 'app/main/main.html'
        controller: 'MainCtrl'
        css: 'app/main/main.css'
