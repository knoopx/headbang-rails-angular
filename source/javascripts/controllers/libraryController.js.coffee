@headbang.controller "libraryCtrl", ($scope, $http) ->
  $scope.$watch "filter", ->
    $scope.offset = 0
    $scope.scrollEndActive = true
    $scope.refresh()

  $scope.scrollEnd = () ->
    $scope.scrollEndActive = false
    $scope.offset += $scope.limit
    $scope.fetch().success (response) ->
      if response.length > 0
        $scope.releases = $scope.releases.concat(response)
        $scope.scrollEndActive = true

  $scope.fetch = ->
    $http.get("/releases", params: { limit: $scope.limit, offset: $scope.offset, filter: $scope.filter })

  $scope.refresh = ->
    $scope.fetch().success (response) ->
      $scope.releases = response
