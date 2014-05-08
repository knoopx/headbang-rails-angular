@headbang.controller "mainNavigationCtrl", ($scope, $http, $q) ->
  $scope.limit = 10

  $scope.$watch "filter", ->
    $scope.spinner.navigation = $q.all([
      $http.get("/artists", params: {limit: $scope.limit, order: "play_count desc, releases_count desc", filter: $scope.filter}),
      $http.get("/releases", params: {limit: $scope.limit, order: "play_count desc", filter: $scope.filter}),
      $http.get("/genres", params: {limit: $scope.limit, filter: $scope.filter}),
      $http.get("/labels", params: {limit: $scope.limit, filter: $scope.filter})
    ]).then (values) ->
      [$scope.artists, $scope.releases, $scope.genres, $scope.labels] = values.map (value)-> value.data
