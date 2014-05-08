@headbang.directive "debounce", ($timeout) ->
  restrict: "A"
  require: "ngModel"
  priority: 99
  link: (scope, el, attrs, ngModelCtrl) ->
    return  if attrs.type is "radio" or attrs.type is "checkbox"
    el.unbind "input"
    debounce = undefined
    el.bind "input", ->
      $timeout.cancel debounce
      debounce = $timeout(->
        scope.$apply ->
          ngModelCtrl.$setViewValue el.val()
      , attrs.debounce or 1000)

    el.bind "blur", ->
      scope.$apply ->
        ngModelCtrl.$setViewValue el.val()
