#= require angular
#= require angular-animate
#= require angular-ui
#= require angular-route
#= require angular-media-player
#= require ngStorage
#= require_self
#= require_tree .

@headbang = angular.module "headbang", ["mediaPlayer", "ngStorage", 'ngRoute', 'ngAnimate', 'ui']

@headbang.run ($rootScope, $route, $location, $localStorage) ->
  $rootScope.$location = $location
  $rootScope.$route = $route
  $rootScope.$storage = $localStorage
  $rootScope.endpoint = "http://localhost:3000"

  $rootScope.$on "$routeChangeStart", (e, route) ->
    $rootScope.$route.current.name = route.name if $rootScope.$route.current

@headbang.config ($httpProvider, $routeProvider) ->
  $httpProvider.defaults.headers.common["Accept"] = "application/json"

  $routeProvider.when('/artists',
    templateUrl: 'templates/artists/index.html'
    controller: 'artistsCtrl'
  ).when('/collections/:id',
    templateUrl: 'templates/collections/show.html'
    controller: 'collectionCtrl'
    name: 'collection'
  ).when('/artists/:id',
    templateUrl: 'templates/artists/show.html'
    controller: 'artistCtrl'
    name: 'artist'
  ).when('/releases/:id',
    templateUrl: 'templates/releases/show.html'
    controller: 'releaseCtrl'
  ).when('/labels/:id',
    templateUrl: 'templates/labels/show.html'
    controller: 'labelCtrl'
  ).otherwise(
    templateUrl: 'templates/releases/index.html'
    controller: 'libraryCtrl'
    name: 'library'
  )
