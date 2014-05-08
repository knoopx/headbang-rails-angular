#= require angular
#= require angular-animate
#= require angular-ui
#= require angular-bootstrap
#= require angular-route
#= require angular-media-player
#= require angular-filter
#= require angular-touch
#= require ngStorage
#= require mousetrap
#= require_self
#= require_tree

@headbang = angular.module "headbang", ["mediaPlayer", "ngStorage", 'ngRoute', 'ngAnimate', 'ngTouch', 'ui', 'ui.bootstrap', 'angular.filter']

@headbang.run ($rootScope, $route, $location) ->
  $rootScope.$location = $location
  $rootScope.$route = $route

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
  ).when('/labels/:id',
    templateUrl: 'templates/labels/show.html'
    controller: 'labelCtrl'
  ).when('/settings',
    templateUrl: 'templates/settings.html'
    controller: 'settingsCtrl'
  ).otherwise(
    templateUrl: 'templates/library/index.html'
    controller: 'libraryCtrl'
    name: 'library'
  )
