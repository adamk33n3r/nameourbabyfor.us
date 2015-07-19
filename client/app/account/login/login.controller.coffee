'use strict'

angular.module 'nameourbabyforusApp'
.controller 'LoginCtrl', ($scope, Auth, $location, $window) ->
  $scope.user = {}
  $scope.errors = {}
  $scope.login = (form) ->
    $scope.submitted = true

    if form.$valid
      # Logged in, redirect to home
      Auth.login
        email: $scope.user.email
        password: $scope.user.password

      .then ->
        $location.path '/'

      .catch (err) ->
        $scope.errors.other = err.message

  $scope.loginOauth = (provider) ->
    if provider is 'facebook!!!'
      top = $window.screen.height / 2 - 240
      left = $window.screen.width / 2 - 250
      popup = $window.open '/auth/' + provider, 'Facebook Login', "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, height=480, width=500, top=#{top}, left=#{left}"
      popup.focus() if $window.focus
    else
      $window.location.href = '/auth/' + provider
