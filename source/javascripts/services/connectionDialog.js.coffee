@headbang.service "connectionDialog", ($modal) ->
  open: (endpoint) ->
    modal = $modal.open
      templateUrl: "templates/connect.html"
      controller: "connectCtrl"
      size: "sm"
      resolve:
        endpoint: -> endpoint

    modal.result
