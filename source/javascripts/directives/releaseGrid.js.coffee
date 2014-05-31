@headbang.directive "releaseGrid", ->
  restrict: 'E'
  templateUrl: "templates/release_grid.html"
  scope:
    releases: "="
    onPlay: "&play"
    onEnqueue: "&enqueue"

  controller: ($scope, $location) ->
    $scope.show = (release) ->
      $location.path("/releases/#{release.id}")

    $scope.play = ($event, release) ->
      $event.stopPropagation()
      $scope.onPlay(release: release)

    $scope.enqueue = ($event, release) ->
      $event.stopPropagation()
      $scope.onEnqueue(release: release)
