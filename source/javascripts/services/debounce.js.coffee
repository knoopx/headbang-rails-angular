@headbang.factory "debounce", ($timeout) ->
  (fn, timeout, apply) ->
    timeout = (if angular.isUndefined(timeout) then 0 else timeout)
    apply = (if angular.isUndefined(apply) then true else apply) # !!default is true! most suitable to my experience
    nthCall = 0
    ->
      that = this
      argz = arguments_
      nthCall++
      later = ((version) ->
        ->
          fn.apply that, argz  if version is nthCall)(nthCall)
      $timeout later, timeout, apply
