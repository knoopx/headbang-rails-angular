@headbang.filter "rawHtml", ($sce) ->
    (value) ->
      $sce.trustAsHtml(value)
