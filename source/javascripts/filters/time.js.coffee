@headbang.filter "time", ->
  (input) ->
    z = (n) ->
      ((if n < 10 then "0" else "")) + n
    seconds = input % 60
    minutes = Math.floor(input / 60)
    z(minutes) + ":" + z(seconds)
