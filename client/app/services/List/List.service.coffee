'use strict'

angular.module 'nameourbabyforusApp'
.factory 'List', ($resource) ->
  $resource '/api/lists/:id',
    id: '@_id'
