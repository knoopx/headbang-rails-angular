@headbang.controller "labelCtrl", ($routeParams, $http, $scope) ->
  $http.get("/labels/#{$routeParams.id}").success (response) ->
    $scope.label = response

    $http.get("/artists/#{$routeParams.id}/releases").success (response) ->
      $scope.label.releases = response
