@headbang.directive "resizable", ($document) ->
  ($scope, $element, $attrs) ->
    $element.addClass("resizable")
    $element.css(width: "#{$attrs.resizableMin}px")

    mousemove = (event) ->
      if $attrs.resizable is "vertical"
        x = event.pageX
        x = parseInt($attrs.resizableMax) if $attrs.resizableMax and x > $attrs.resizableMax
        $element.css(width: "#{x}px")
      else
        y = window.innerHeight - event.pageY
        $element.css(height: "#{y}px")

    mouseup = ->
      $document.unbind "mousemove", mousemove
      $document.unbind "mouseup", mouseup

    $element.on "mousedown", (event) ->
      # TODO: figure a resizeable zone
      if event.pageX >= $element.css("x") - 5
        event.preventDefault()
        $document.on "mousemove", mousemove
        $document.on "mouseup", mouseup
