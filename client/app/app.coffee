'use strict'

angular.module 'nameourbabyforusApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'btford.socket-io',
  'ui.router',
  'ui.bootstrap',
  'ngAnimate',
  'uiRouterStyles',
  'ngFacebook',
  'cfp.hotkeys'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider, $facebookProvider) ->
  $facebookProvider.setAppId '1420268104970270'
  $facebookProvider.setCustomInit
    xfbml: true
    version: 'v2.4'
  $urlRouterProvider
  .otherwise '/'

  $locationProvider.html5Mode true
  $httpProvider.interceptors.push 'authInterceptor'


.controller 'MainController', ($rootScope) ->
  console.log "Booting app"
  $rootScope.settings = {}

.factory 'authInterceptor', ($rootScope, $q, $cookieStore, $location) ->
  # Add authorization token to headers
  request: (config) ->
    config.headers = config.headers or {}
    config.headers.Authorization = 'Bearer ' + $cookieStore.get 'token' if $cookieStore.get 'token'
    return config

  # Intercept 401s and redirect you to login
  responseError: (response) ->
    if response.status is 401
      $location.path '/login'
      # remove any stale tokens
      $cookieStore.remove 'token'

    $q.reject response

.filter 'capitalize', ->
  (input, scope) ->
    if input
      input = input.toLowerCase();
      return input.substring(0, 1).toUpperCase() + input.substring(1)

.filter 'slice', ->
  (arr, start, end) ->
    return if not arr?
    arr.slice start, end

.run ($rootScope, $location, $window, Auth) ->
  # Redirect to login if route requires auth and you're not logged in
  $rootScope.$on '$stateChangeStart', (event, next) ->
    Auth.isLoggedInAsync (loggedIn) ->
      $location.path "/login" if next.authenticate and not loggedIn

  # Load the facebook SDK asynchronously
  # If we've already installed the SDK, we're done
  return if document.getElementById('facebook-jssdk')

  # Get the first script element, which we'll use to find the parent node
  body = document.getElementsByTagName('body')[0]

  # Create a new script element and set its id
  facebookJS = document.createElement('script')
  facebookJS.id = 'facebook-jssdk'

  # Set the new script's source to the source of the Facebook JS SDK
  facebookJS.src = '//connect.facebook.net/en_US/sdk.js'

  # Insert the Facebook JS SDK into the DOM
  body.insertBefore(facebookJS, body.firstChild)
