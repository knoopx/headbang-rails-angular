@headbang.controller "artistCtrl", ($routeParams, $http, $scope) ->
  $http.get("/artists/#{$routeParams.id}").success (response) ->
    $scope.artist = response

    $http.get("/artists/#{$routeParams.id}/releases").success (response) ->
      $scope.artist.releases = response
