@headbang.directive "resizable", ($document) ->
  ($scope, $element, $attrs) ->
    $element.addClass("resizable")
    $element.css(width: "#{$attrs.resizableMin}px")

    $handle = angular.element("<div class='resizable-handle resizable-handle-#{$attrs.resizable}'></div>")
    $element.append($handle)

    mousemove = (event) ->
      switch $attrs.resizable
        when "left", "right"
          switch $attrs.resizable
            when "left"
              bounds = $element[0].getBoundingClientRect()
              width = bounds.width + (bounds.left - event.clientX)
            when "right"
              width = event.clientX

          if $attrs.resizableMin and width < $attrs.resizableMin
            width = parseInt($attrs.resizableMin)

          if $attrs.resizableMax and width > $attrs.resizableMax
            width = parseInt($attrs.resizableMax)

          $element.css(width: "#{width}px")

        else
          throw "Unknown resizable option: #{$attrs.resizable}"

    mouseup = ->
      $document.unbind "mousemove", mousemove
      $document.unbind "mouseup", mouseup

    $handle.on 'mousedown', (event) ->
      event.preventDefault()
      $document.on "mousemove", mousemove
      $document.on "mouseup", mouseup
