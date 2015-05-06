# author : meinzug@me.com : 2015.02.24 11:08

exports.loadIndex = (server) ->
  indexList = [
    {method: "POST",   path: "/buildings",      handler: post}
    {method: "GET",    path: "/buildings",      handler: getList}
    {method: "GET",    path: "/buildings/{id}", handler: get}
    {method: "PUT",    path: "/buildings/{id}", handler: put}
    {method: "DELETE", path: "/buildings/{id}", handler: del}
  ]
  server.route indexList

# POST /buildings
post = (req, reply) ->
  reply {"result": "POST"}
  return

# GET /buildings
getList = (req, reply) ->
  reply {"result": "GET LIST"}
  return

# GET /buildings/{id}
get = (req, reply) ->
  reply {"result": "GET"}
  return

# PUT /buildings/{id}
put = (req, reply) ->
  reply {"result": "PUT"}
  return

# DELETE /buildings/{id}
del = (req, reply) ->
  reply {"result": "DELETE"}
  return
