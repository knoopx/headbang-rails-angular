@headbang.controller "appCtrl", ($scope, $http, $modal) ->
  $scope.filter = null
  $scope.offset = 0
  $scope.limit = 120

  $scope.showSettings = ->
    modalInstance = $modal.open
      templateUrl: "templates/settings/connectModal.html"
#      controller: ModalInstanceCtrl
#      size: size
      resolve:
        endpoint: -> $scope.endpoint

    modalInstance.result.then ((selectedItem) ->

    ), ->
      $log.info "Modal dismissed"
