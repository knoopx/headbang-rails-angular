@headbang.directive "releaseGrid", ->
  restrict: 'E'
  templateUrl: "templates/components/release_grid.html"
  replace: true
  scope:
    releases: "="
    player: "="
    playlist: "="

  controller: ($scope, $http) ->
    $scope.playRelease = (release, replace = false) ->
      $http.get("/releases/#{release.id}/tracks").success (response) ->
        if replace
          $scope.playlist = response
          $scope.player.play(0)
        else
          $scope.playlist = $scope.playlist.concat(response)
