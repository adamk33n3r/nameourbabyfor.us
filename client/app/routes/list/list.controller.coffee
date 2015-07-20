'use strict'

angular.module 'nameourbabyforusApp'
.controller 'ListCtrl', ($scope, List) ->
  List.query().$promise.then (lists) ->
    $scope.lists = lists
