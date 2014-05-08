@headbang.controller "sourcesCtrl", ($scope, $modal, $http) ->
  $scope.sources = []

  $scope.addSource = ->
    modal = $modal.open
      templateUrl: "templates/browse.html"
      controller: "browseCtrl"
      size: "md"
      resolve:
        path: -> "~"

    modal.result.then (path) ->
      $http.post("/sources", source: {path: path}).success($scope.refreshSources)

  $scope.refreshSources = ->
    $http.get("/sources").success (response) ->
      $scope.sources = response

  $scope.removeSource = (source) ->
    if confirm("Are you sure?")
      $http.delete("/sources/#{source.id}").success($scope.refreshSources)

  $scope.refreshSources()
