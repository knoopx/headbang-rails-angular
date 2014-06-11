@headbang.service "collection", ($q, $rootScope) ->
  (name) ->
    NeDB = require('nedb')
    path = require('path')
    nw = require('nw.gui')
    db = new NeDB(filename: path.join(nw.App.dataPath, "#{name}.db"), autoload: true)

    find: (conditions = {}) ->
      deferred = $q.defer()
      db.find conditions, (e, result) ->
        $rootScope.$apply ->
          if e
            deferred.reject(e)
          else
            deferred.resolve(result)

      deferred.promise



