'use strict'

angular.module 'nameourbabyforusApp'
.controller 'NavbarCtrl', ($scope, $location, Auth) ->
  $scope.menu = [
    title: 'Home'
    link: '/'
  ,
    title: 'Campaigns'
    link: '/campaign/list'
  ]
  $scope.isCollapsed = true
  $scope.isLoggedIn = Auth.isLoggedIn
  $scope.isAdmin = Auth.isAdmin
  $scope.getCurrentUser = Auth.getCurrentUser

  $scope.logout = ->
    Auth.logout()
    $location.path '/login'

  $scope.isActive = (route) ->
    route is $location.path()

  $scope.loginAsTest = ->
    Auth.login
      email: 'test@test.com'
      password: 'test'
    .then ->
      $location.path '/campaign/list'
