@headbang.directive "releaseGrid", ->
  restrict: 'E'
  templateUrl: "templates/release_grid.html"
  scope:
    releases: "="
    onPlay: "&play"
    onEnqueue: "&enqueue"
    onDelete: "&delete"
    onClickArtist: "&clickArtist"
    onClickRelease: "&clickRelease"

  link: (scope, el, attrs) ->
    scope.onDelete = null unless angular.isDefined(attrs.delete)

  controller: ($scope) ->
    $scope.play = ($event, release) ->
      $event.stopPropagation()
      $scope.onPlay(release: release)

    $scope.enqueue = ($event, release) ->
      $event.stopPropagation()
      $scope.onEnqueue(release: release)

    $scope.delete = (release) ->
      $scope.onDelete(release: release)

    $scope.clickRelease = (release) ->
      $scope.onClickRelease(release: release)

    $scope.clickArtist = (artist) ->
      $scope.onClickArtist(artist: artist)
