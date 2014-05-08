@headbang.directive "draggable", ->
  scope:
    data: "=draggableData"

  link: (scope, el, attrs) ->
    el[0].draggable = true
    el.on "dragstart", (e) ->
      e.dataTransfer.setData(attrs.draggable, scope.data)
      @classList.add "dragging"

    el.on "dragend", ->
      @classList.remove "dragging"

@headbang.directive "droppable", ($parse) ->
  link: (scope, el, attrs) ->
    el.on "dragover", (e) ->
      unless e.dataTransfer.types.indexOf(attrs.droppable) == -1
        e.preventDefault()
        @classList.add("dropping")

    el.on "dragenter", ->
      @classList.add("dropping")

    el.on "dragleave", ->
      @classList.remove("dropping")

    el.on "drop", (e) ->
      e.stopPropagation()
      @classList.remove("dropping")
      $parse(attrs.droppableDrop)(scope, $data: e.dataTransfer.getData(attrs.droppable))
