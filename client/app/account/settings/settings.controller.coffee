'use strict'

angular.module 'nameourbabyforusApp'
.controller 'SettingsCtrl', ($rootScope, $scope, User, Auth) ->
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

  bsCSS = $('link#bootstrap')
  if not $rootScope.settings.gotThemes
    $.get 'http://api.bootswatch.com/3/', (data) ->
      $rootScope.$apply ->
        $rootScope.settings.gotThemes = true
        $rootScope.settings.themes = [
          name: 'Default'
          cssCdn: 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'
        ].concat data.themes
        $rootScope.settings.selectedTheme = $rootScope.settings.themes.filter((elem) ->
          elem.name is 'Paper'
        )[0]
  $scope.setTheme = (to) ->
    console.log "Changing theme to #{to}"
    bsCSS.attr 'href', to.cssCdn
    return

