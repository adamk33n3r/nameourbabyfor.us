'use strict'

angular.module 'nameourbabyforusApp'
.factory 'User', ($resource) ->
  $resource '/api/users/:id/:controller',
    id: '@_id'
  ,
    changePassword:
      method: 'PUT'
      params:
        controller: 'password'

    get:
      method: 'GET'
      params:
        id: 'me'

    setRole:
      method: 'POST'
      params:
        controller: 'set-role'

