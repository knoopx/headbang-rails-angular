@headbang.controller "playlistCtrl", ($scope) ->
  $scope.$storage.playlist ||= []
