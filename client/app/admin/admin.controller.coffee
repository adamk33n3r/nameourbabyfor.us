'use strict'

angular.module 'nameourbabyforusApp'
.controller 'AdminCtrl', ($scope, $http, Auth, User) ->

  $http.get '/api/users'
  .success (users) ->
    $scope.users = users

  $scope.delete = (user) ->
    User.remove id: user._id
    _.remove $scope.users, user

  $scope.setRole = (user) ->
    User.setRole
      id: user._id
    ,
      role: user.role
