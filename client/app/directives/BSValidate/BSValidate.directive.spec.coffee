'use strict'

describe 'Directive: BSValidate', ->

  # load the directive's module and view
  beforeEach module 'nameourbabyforusApp'
  beforeEach module 'app/directives/BSValidate/BSValidate.html'
  element = undefined
  scope = undefined
  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<-b-s-validate></-b-s-validate>'
    element = $compile(element) scope
    scope.$apply()
    expect(element.text()).toBe 'this is the BSValidate directive'

