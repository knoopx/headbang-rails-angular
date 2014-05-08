@headbang.directive "scrollEnd", ->
  (scope, el, attrs) ->
    el = el[0]
    el.bind "scroll mousewheel", ->
      if scope.$eval(attrs.scrollEndIf) && (el.scrollTop + el.offsetHeight >= el.scrollHeight - scope.$eval(attrs.scrollEndDistance))
        scope.$apply(attrs.scrollEnd)
