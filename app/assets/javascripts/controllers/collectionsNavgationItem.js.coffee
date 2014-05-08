@headbang.controller "collectionsNavigationItemCtrl", ($scope, $http, $window) ->
  $scope.resetNewCollection = ->
    $scope.newCollection = {}

  $scope.createCollection = ->
    $http.post("/collections", collection: $scope.newCollection).success ->
      $scope.resetNewCollection()
      $scope.refreshCollections()

  $scope.removeCollection = (collection) ->
    if $window.confirm("Are you sure?")
      $http.delete("/collections/#{collection.id}").success ->
        $scope.refreshCollections()

  $scope.refreshCollections = ->
    $http.get("/collections").success (response) ->
      $scope.collections = response

  $scope.resetNewCollection()
  $scope.refreshCollections()
