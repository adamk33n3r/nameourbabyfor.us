'use strict'

angular.module 'nameourbabyforusApp'
.factory 'Campaign', ($resource) ->
  $resource '/api/campaigns/:id/:action',
    id: '@id'
  ,
    vote:
      method: 'PUT'
      params:
        action: 'vote'
    getNames:
      method: 'GET'
      params:
        action: 'get-names'
    setState:
      method: 'PUT'
      params:
        action: 'set-state'
