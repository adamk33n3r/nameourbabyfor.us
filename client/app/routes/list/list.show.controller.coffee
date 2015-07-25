'use strict'

angular.module 'nameourbabyforusApp'
.controller 'ListShowCtrl', ($scope, $stateParams, List) ->

  $scope.pagination = {
    page: 1
    itemsPerPage: 10
    maxSize: 5
    maxSizeMobile: 3
  }

  List.get
    id: $stateParams.id
    names: true
  .$promise.then (list) ->
    $scope.list = list

  $scope.getNames = ->
    to = $scope.pagination.page * $scope.pagination.itemsPerPage - 1
    from = to - $scope.pagination.itemsPerPage + 1
    List.getNames
      id: $stateParams.id
      from: from
      to: to
    .$promise.then (names) ->
      $scope.names = names

  $scope.getNames()

  $scope.setGender = (name) ->
    List.setGender
      id: $stateParams.id
    ,
      name: name.name
      gender: name.gender

  $scope.setEnabled = (name) ->
    List.setEnabled
      id: $stateParams.id
    ,
      name: name.name
      enabled: name.enabled
