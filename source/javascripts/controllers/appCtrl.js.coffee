@headbang.controller "appCtrl", ($scope, $http) ->
  $scope.filter = null
  $scope.offset = 0
  $scope.limit = 120
  $scope.playlist = []

  $scope.playRelease = (release) ->
    $http.get("/releases/#{release.id}/tracks").success (response) ->
      $scope.playlist = response
      $scope.player.play(0)

  $scope.enqueueRelease = (release) ->
    $http.get("/releases/#{release.id}/tracks").success (response) ->
      $scope.playlist.concat(response)
