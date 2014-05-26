@headbang.factory "httpInterceptor", ($rootScope) ->
  request: (config) ->
    config.url = $rootScope.endpoint + config.url unless config.url.indexOf("template") == 0
    config

@headbang.config ($httpProvider) ->
  $httpProvider.interceptors.push "httpInterceptor"
