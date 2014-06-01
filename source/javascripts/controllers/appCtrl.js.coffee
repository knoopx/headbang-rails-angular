@headbang.controller "appCtrl", ($scope, $http, $timeout, $localStorage, connectionDialog) ->
  $scope.filter = null
  $scope.offset = 0
  $scope.limit = 120
  $scope.playlist = []

  Mousetrap.bind "space", (e) ->
    e.preventDefault()
    $scope.player.playPause()

  Mousetrap.bind "command+left", (e) ->
    e.preventDefault()
    $scope.player.prev()

  Mousetrap.bind "command+right", (e) ->
    e.preventDefault()
    $scope.player.next()

  $scope.play = (tracks) ->
    $scope.playlist = tracks
    $timeout ->
      $scope.player.play(0)

  $scope.enqueue = (tracks) ->
    $scope.playlist = $scope.playlist.concat(tracks)

  $scope.playArtist = (artist) ->
    $http.get("/artists/#{artist.id}/tracks").success($scope.play)

  $scope.enqueueArtist = (artist) ->
    $http.get("/artists/#{artist.id}/tracks").success($scope.enqueue)

  $scope.playRelease = (release) ->
    $http.get("/releases/#{release.id}/tracks").success($scope.play)

  $scope.enqueueRelease = (release) ->
    $http.get("/releases/#{release.id}/tracks").success($scope.enqueue)

  $scope.playCollection = (collection) ->
    $http.get("/collections/#{collection.id}/tracks").success($scope.play)

  $scope.enqueueCollection = (collection) ->
    $http.get("/collections/#{collection.id}/tracks").success($scope.enqueue)

  $scope.connection = ->
    connectionDialog.open($localStorage.endpoint).then (endpoint) ->
      $localStorage.endpoint = endpoint

