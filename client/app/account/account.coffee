'use strict'

angular.module 'nameourbabyforusApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'login',
    url: '/login'
    views:
      '':
        templateUrl: 'app/account/login/login.html'
        controller: 'LoginCtrl'
        css: 'app/account/login/login.css'

  .state 'signup',
    url: '/signup'
    views:
      '':
        templateUrl: 'app/account/signup/signup.html'
        controller: 'SignupCtrl'
        css: 'app/account/login/login.css'

  .state 'settings',
    url: '/settings'
    views:
      '':
        templateUrl: 'app/account/settings/settings.html'
        controller: 'SettingsCtrl'
        css: 'app/account/login/login.css'
    authenticate: true
