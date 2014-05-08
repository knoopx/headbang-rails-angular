@headbang.controller "collectionCtrl", ($routeParams, $scope, $http) ->
  $scope.refresh = ->
    $scope.spinner.ngView = $http.get("/collections/#{$routeParams.id}").success (response) ->
      $scope.collection = response
      $scope.spinner.ngView = $http.get("/collections/#{$routeParams.id}/releases", params: {embed: "collections"}).success (response) ->
        $scope.collection.releases = response

  $scope.removeRelease = (release) ->
    $http.get("/releases/#{release.id}", params: {embed: "collections"}).success (release) ->
      release.collection_ids.splice(release.collection_ids.indexOf($scope.collection.id), 1)
      $http.put("/releases/#{release.id}", release: {collection_ids: release.collection_ids}).success (release) ->
        $http.get("/collections/#{$routeParams.id}/releases").success (response) ->
          $scope.collection.releases = response

  $scope.rename = ->
    if name = prompt("Rename collection:", $scope.collection.name)
      $http.put("/collections/#{$scope.collection.id}", collection: {name: name}).success ->
        $scope.collection.name = name

  $scope.refresh()
