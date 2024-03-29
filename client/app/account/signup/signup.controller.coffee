'use strict'

angular.module 'nameourbabyforusApp'
.controller 'SignupCtrl', ($scope, Auth, $location, $window) ->
  if $window.location.hash is '#close_window'
    console.log 'closing window'
    $window.close()
  else
    console.log 'not closing window cause hash == ' + $window.location.hash
  $scope.user = {}
  $scope.errors = {}
  $scope.register = (form) ->
    $scope.submitted = true

    if form.$valid
      # Account created, redirect to home
      Auth.createUser
        name: $scope.user.name
        email: $scope.user.email
        password: $scope.user.password

      .then ->
        $location.path '/'

      .catch (err) ->
        err = err.data
        $scope.errors = {}

        # Update validity of form fields that match the mongoose errors
        angular.forEach err.errors, (error, field) ->
          form[field].$setValidity 'mongoose', false
          $scope.errors[field] = error.message

  $scope.loginOauth = (provider) ->
    $window.location.href = '/auth/' + provider
