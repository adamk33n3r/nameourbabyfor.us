'use strict'

angular.module 'nameourbabyforusApp'
.factory 'Campaign', ($resource) ->
  $resource '/api/campaigns/:id',
    id: '@_id'
