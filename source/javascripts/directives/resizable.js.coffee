@headbang.directive "uiLayoutWidth", ($document) ->
  scope:
    uiLayoutWidth: "="
  link: ($scope, $element, $attrs) ->
    $scope.watch($element.width, ->
      console.log "resize"
    )
#    $element.on 'resize', ->
#      console.log "resize"
#      $scope.bindWidth = $element.css("width")
#      $scope.$apply()
