@headbang.controller "similarArtistsCtrl", ($http, $scope) ->
  $scope.similarArtists = []

  $scope.fetch = ->
    $http.get("/artists/#{$scope.artist.id}/similar_artists", params: {limit: 10})

  $scope.fetch().success (response) ->
    $scope.similarArtists = response
