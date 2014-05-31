@headbang.controller "browseCtrl", ($scope, $modalInstance, $http, path) ->
  $scope.items = []
  $scope.path = path

  $scope.$watch "path", (path) ->
    $http.get("/browse", params: {path: path}).success (response) ->
      $scope.items = response

  $scope.browse = (path) ->
    $scope.path = path

  $scope.ok = ->
    $modalInstance.close($scope.path)

  $scope.cancel = ->
    $modalInstance.dismiss("cancel")
