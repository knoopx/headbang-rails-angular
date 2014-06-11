@headbang.controller "collectionsNavigationItemCtrl", ($scope, $http, $window, db, $q) ->
  $scope.resetNewCollection = ->
    $scope.newCollection = {}

  $scope.createCollection = ->
    db.collections.insert $scope.newCollection, ->
      $scope.resetNewCollection()
      $scope.refreshCollections()

  $scope.removeCollection = (collection) ->
    if $window.confirm("Are you sure?")
      db.collections.remove _id: collection._id, {}, ->
        $scope.refreshCollections()

  $scope.refreshCollections = ->
    db.collections.find().then (e, result) ->
      $scope.collections = result

  $scope.resetNewCollection()
  $scope.refreshCollections()
