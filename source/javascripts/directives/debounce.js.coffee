@headbang.directive "debounce", ($timeout) ->
  restrict: "A"
  require: "ngModel"
  priority: 99
  link: (scope, elm, attr, ngModelCtrl) ->
    return  if attr.type is "radio" or attr.type is "checkbox"
    elm.unbind "input"
    debounce = undefined
    elm.bind "input", ->
      $timeout.cancel debounce
      debounce = $timeout(->
        scope.$apply ->
          ngModelCtrl.$setViewValue elm.val()
      , attr.debounce or 1000)

    elm.bind "blur", ->
      scope.$apply ->
        ngModelCtrl.$setViewValue elm.val()
