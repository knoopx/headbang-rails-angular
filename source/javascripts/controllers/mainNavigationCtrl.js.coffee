@headbang.controller "mainNavigationCtrl", ($scope, $http) ->
  $scope.limit = 10

  $scope.$watch "filter", ->
    $http.get("/artists", params: { limit: $scope.limit, order: "play_count desc, releases_count desc", filter: $scope.filter }).success (response) ->
      $scope.artists = response

    $http.get("/releases", params: { limit: $scope.limit, order: "play_count desc", filter: $scope.filter }).success (response) ->
      $scope.releases = response

    $http.get("/genres", params: { limit: $scope.limit, filter: $scope.filter }).success (response) ->
      $scope.genres = response

    $http.get("/labels", params: { limit: $scope.limit, filter: $scope.filter }).success (response) ->
      $scope.labels = response
