'use strict'

angular.module 'nameourbabyforusApp'
.factory 'List', ($resource) ->
  $resource '/api/lists/:id/:action',
    id: '@id'
  ,
    setGender:
      method: 'POST'
      params:
        action: 'set-gender'
    setEnabled:
      method: 'POST'
      params:
        action: 'set-enabled'
    getNames:
      method: 'GET'
      isArray: true
      params:
        action: 'get-names'
