'use strict'

angular.module 'nameourbabyforusApp'
.controller 'NavbarCtrl', ($scope, $location, Auth) ->
  $scope.menu = [
    title: 'Home'
    link: '/'
  ,
    title: 'About'
    link: '/about'
  ,
    title: 'Campaigns'
    link: '/campaigns/list'
  ]
  $scope.isCollapsed = true
  $scope.isLoggedIn = Auth.isLoggedIn
  $scope.isAdmin = Auth.isAdmin
  $scope.isTester = Auth.isTester
  $scope.isElevated = Auth.isElevated
  $scope.getCurrentUser = Auth.getCurrentUser

  $scope.logout = ->
    Auth.logout()
    $location.path '/login'

  $scope.isActive = (route) ->
    route.split('/')[1] is $location.path().split('/')[1]
