@headbang.factory 'connection', ($q, $localStorage, connectionDialog) ->
  defer = $q.defer()

  if $localStorage.endpoint
    defer.resolve($localStorage.endpoint)
  else
    connectionDialog.open("http://localhost:6600").then (endpoint) ->
      $localStorage.endpoint = endpoint
      defer.resolve(endpoint)

  defer.promise

@headbang.config ($httpProvider) ->
  $httpProvider.interceptors.push ($injector) ->
    request: (config) ->
      if config.url.indexOf("template") == 0
        config
      else
        $injector.invoke (connection) ->
          connection.then (endpoint) ->
            config.url = endpoint + config.url
            config
