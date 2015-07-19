'use strict'

angular.module 'nameourbabyforusApp'
.directive 'bsValidate', ->
  templateUrl: 'app/directives/BSValidate/BSValidate.html'
  restrict: 'EA'
  replace: false
  transclude: true
  scope:
    form: '@'
    on: '@'
  link: ($scope, element, attrs) ->
    $scope.isValid = (ele) ->
      return ele.$dirty and  ele.$valid
    $scope.isInvalid = (ele) ->
      return ele.$dirty and ele.$invalid
