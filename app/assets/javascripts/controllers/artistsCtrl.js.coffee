@headbang.controller "artistsCtrl", ($routeParams, $http, $scope, $location) ->
  $scope.offset = 0
  $scope.limit = 120
  $scope.artists = []
  $scope.scrollEndActive = true

  $scope.$watch "filter", ->
    $scope.offset = 0
    $scope.scrollEndActive = true
    $scope.refresh()

  $scope.scrollEnd = () ->
    $scope.scrollEndActive = false
    $scope.offset += $scope.limit
    $scope.fetch().success (response) ->
      if response.length > 0
        $scope.artists = $scope.artists.concat(response)
        $scope.scrollEndActive = true

  $scope.fetch = ->
    $http.get("/artists", params: {limit: $scope.limit, offset: $scope.offset, filter: $scope.filter})

  $scope.refresh = ->
    $scope.fetch().success (response) ->
      $scope.artists = response
