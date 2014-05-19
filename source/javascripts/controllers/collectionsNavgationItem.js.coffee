@headbang.controller "collectionsNavigationItemCtrl", ($scope, $http, $window) ->
  $scope.resetNewCollection = ->
    $scope.newCollection = {}

  $scope.createCollection = ->
    $http.post("/collections", $scope.newCollection).success (response) ->
      $scope.resetNewCollection()
      $scope.refreshCollections()

  $scope.removeCollection = (collection) ->
    if $window.confirm("Are you sure?")
      $http.delete("/collections/#{collection.id}").success (response) ->
        $scope.refreshCollections()

  $scope.refreshCollections = ->
    $http.get("/collections").success (response) ->
      $scope.collections = response

  $scope.resetNewCollection()
  $scope.refreshCollections()
