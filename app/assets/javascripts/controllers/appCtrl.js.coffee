@headbang.controller "appCtrl", ($scope, $http, $timeout, $location, $localStorage) ->
  $scope.filter = null
  $scope.offset = 0
  $scope.limit = 120

  $scope.spinner = {}

  $scope.localStorage = $localStorage
  $scope.localStorage.playlist ||= []

  Mousetrap.bind "space", (e) ->
    e.preventDefault()
    $scope.player.playPause()

  Mousetrap.bind "command+left", (e) ->
    e.preventDefault()
    $scope.player.prev()

  Mousetrap.bind "command+right", (e) ->
    e.preventDefault()
    $scope.player.next()

  $scope.$on "$routeChangeStart", ->
    $scope.openLeftSidebar = false
    $scope.openRightSidebar = false

  $scope.toggleLeftSidebar = ->
    $scope.openLeftSidebar = !$scope.openLeftSidebar

  $scope.toggleRightSidebar = ->
    $scope.openRightSidebar = !$scope.openRightSidebar

  $scope.play = (tracks) ->
    $scope.localStorage.playlist = tracks
    $scope.openRightSidebar = true
    $timeout ->
      $scope.player.play(0)

  $scope.shufflePlaylist = ->
    ((array) ->
      counter = array.length
      while counter > 0
        index = Math.floor(Math.random() * counter)
        counter--
        temp = array[counter]
        array[counter] = array[index]
        array[index] = temp
      array)($scope.localStorage.playlist)

  $scope.showArtist = (artist) ->
    $location.path("/artists/#{artist.id}")

  $scope.enqueue = (tracks) ->
    $scope.localStorage.playlist = $scope.localStorage.playlist.concat(tracks)
    $scope.openRightSidebar = true

  $scope.playArtist = (artist) ->
    $http.get("/artists/#{artist.id}/tracks").success($scope.play)

  $scope.enqueueArtist = (artist) ->
    $http.get("/artists/#{artist.id}/tracks").success($scope.enqueue)

  $scope.fetchArtist = (artist) ->
    $http.post("/artists/#{artist.id}/fetch")

  $scope.playRelease = (release) ->
    $http.get("/releases/#{release.id}/tracks").success($scope.play)

  $scope.enqueueRelease = (release) ->
    $http.get("/releases/#{release.id}/tracks").success($scope.enqueue)

  $scope.playCollection = (collection) ->
    $http.get("/collections/#{collection.id}/tracks").success($scope.play)

  $scope.enqueueCollection = (collection) ->
    $http.get("/collections/#{collection.id}/tracks").success($scope.enqueue)

  $scope.scanSources = ->
    $http.post("/sources/scan")
