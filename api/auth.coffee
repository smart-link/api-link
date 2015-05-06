# author : meinzug@me.com : 2015.02.12 12:22

exports.loadIndex = (server) ->
  indexList = [
    {method: "POST",    path: "/register",    handler: register,   config:{auth:false}}
    {method: "POST",    path: "/login",       handler: login}
    {method: "POST",    path: "/logout",      handler: logout}
    {method: "POST",    path: "/check",       handler: checkToken, config:{auth:false}}
  ]
  server.route indexList

# POST /register
register = (req, reply) ->
  token = tokenManager.makeToken()

  if token
    return reply({"result": req.path + " success"}).header("Authorization", CONST.JWT_BEARER_PREFIX + token)
  else
    return reply {"result": req.path + " fail"}

# POST /login
login = (req, reply) ->
  id = req.payload.id
  pw = req.payload.pw

  if id isnt "meinzug@me.com" or pw isnt "1234"
    return reply {"result": req.path + " fail: " + id}

  token = (req.headers.authorization).split(" ")[1]

  if not token
    console.log "token parsing fail: " + token
    return reply {"result": req.path + "fail"}

  if tokenManager.exist(token)
    console.log "token found: " + token
    return reply {"result": "token found"}

  tokenManager.put(token)
  return reply {"result": "Ok"}

# POST /logout
logout = (req, reply) ->
  token = (req.headers.authorization).split(" ")[1]

  if not token
    console.log "token parsing fail: " + token
    return reply {"result": req.path + " fail"}

  if not tokenManager.delete(token)
    return reply {"result": req.path + " fail"}

  return reply {"result": req.path + " ok"}

# POST /checkToken
checkToken = (req, reply)->
  token = (req.headers.authorization).split(" ")[1]

  if not token
    console.log "token parsing fail: " + token
    return reply {"result": "Fail"}

  if not tokenManager.exist(token)
    return reply {"result": req.path + " fail"}

  return reply {"result": "token found"}
