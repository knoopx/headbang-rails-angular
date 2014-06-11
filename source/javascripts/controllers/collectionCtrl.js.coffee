@headbang.controller "collectionCtrl", ($routeParams, $scope, db) ->
  db.collections.find {}, (e, results) ->
    $scope.collection = results
