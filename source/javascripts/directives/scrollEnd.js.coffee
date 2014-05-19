@headbang.directive "scrollEnd", ->
  (scope, $el, attr) ->
    el = $el[0]
    $el.bind "scroll mousewheel", ->
      if scope.$eval(attr.scrollEndIf) && (el.scrollTop + el.offsetHeight >= el.scrollHeight - scope.$eval(attr.scrollEndDistance))
        scope.$apply(attr.scrollEnd)
