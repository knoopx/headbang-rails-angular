@headbang.controller "connectCtrl", ($scope, $modalInstance, endpoint) ->
  $scope.endpoint =
    url: endpoint

  $scope.connect = ->
    $modalInstance.close($scope.endpoint.url)
