@headbang.controller "collectionItemCtrl", ($scope, $http) ->
  $scope.drop = (id) ->
    $http.get("/releases/#{id}", params: {embed: "collections"}).success (release) ->
      release.collection_ids.push($scope.collection.id)
      $http.put("/releases/#{id}", release: {collection_ids: release.collection_ids}).success (release) ->
        $scope.refreshCollections()
