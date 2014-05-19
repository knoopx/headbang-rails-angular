@headbang.controller "releaseCtrl", ($routeParams, $http, $scope) ->
  $http.get("/releases/#{$routeParams.id}").success (response) ->
    $scope.release = response

    $http.get("/releases/#{$routeParams.id}/tracks").success (response) ->
      $scope.release.tracks = response

    $http.get("/releases/#{$routeParams.id}/releases", params: { duplicate: true }).success (response) ->
      $scope.release.releases = response

      angular.forEach $scope.release.releases, (release) ->
        $http.get("/releases/#{$routeParams.id}/tracks").success (response) ->
          release.tracks = response
