@headbang.directive "spinner", ->
  restrict: "A"
  scope:
    spinner: "="
  link: (scope, el) ->
    scope.$watch "spinner", (value) ->
      if value?
        el.addClass("spinner")
        scope.spinner.then ->
          el.removeClass("spinner")
