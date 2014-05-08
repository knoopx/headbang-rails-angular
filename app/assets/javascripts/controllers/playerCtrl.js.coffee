@headbang.controller "playerCtrl", ($scope, $http) ->
  $scope.$watchCollection '[player.currentTrack, localStorage.playlist]', ->
    if $scope.player.currentTrack
      $scope.track = angular.copy($scope.localStorage.playlist[$scope.player.currentTrack - 1])

      $http.get("/releases/#{$scope.track.release_id}").success (response) ->
        $scope.track.release = response

  $scope.seek = (position) ->
    $scope.player.seek(position)
