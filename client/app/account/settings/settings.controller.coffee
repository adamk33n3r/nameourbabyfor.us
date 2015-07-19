'use strict'

angular.module 'nameourbabyforusApp'
.controller 'SettingsCtrl', ($scope, User, Auth) ->
  $scope.user = {}
  $scope.errors = {}
  $scope.showPass = Auth.getCurrentUser().provider is 'local'
  $scope.changePassword = (form) ->
    $scope.submitted = true
    console.log $scope.user
    if form.$valid
      Auth.changePassword $scope.user.oldPassword, $scope.user.newPassword
      .then ->
        $scope.message = 'Password successfully changed.'

      .catch ->
        form.password.$setValidity 'mongoose', false
        $scope.errors.other = 'Incorrect password'
        $scope.message = ''
