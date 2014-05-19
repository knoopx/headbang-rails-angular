@headbang.controller "playerCtrl", ($scope, $http) ->
  $scope.$watch 'player.currentTrack', ->
    $scope.track = $scope.$storage.playlist[$scope.player.currentTrack - 1]

    $http.get("/releases/#{$scope.track.release_id}").success (response) ->
      $scope.track.release = response

  $scope.seek = (position) ->
    $scope.player.seek(position)
