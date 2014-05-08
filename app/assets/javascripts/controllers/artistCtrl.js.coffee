@headbang.controller "artistCtrl", ($routeParams, $http, $scope) ->
  $scope.spinner.ngView = $http.get("/artists/#{$routeParams.id}").success (response) ->
    $scope.artist = response

    $scope.spinner.ngView = $http.get("/artists/#{$routeParams.id}/releases", params: {embed: "tracks"}).success (response) ->
      $scope.artist.releases = response

  $scope.rename = ->
    if name = prompt("Rename artist:", $scope.artist.name)
      $http.put("/artists/#{$scope.artist.id}", artist: {name: name}).success ->
        $scope.artist.name = name
