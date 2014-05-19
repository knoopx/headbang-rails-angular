@headbang.controller "collectionCtrl", ($routeParams, $scope, $http) ->
  $http.get("/collections/#{$routeParams.id}").success (response) ->
    $scope.collection = response

    $http.get("/collections/#{$routeParams.id}/releases").success (response) ->
      $scope.collection.releases = response
