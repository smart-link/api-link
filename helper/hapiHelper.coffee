# author : meinzug@me.com : 2015.02.11 02:06

# load module
joi = require "joi"

# init config
exports.initConnection = (server) ->
  server.connection
    host  : CONST.SERVER_HOST
    port  : CONST.SERVER_PORT
    routes: {cors : true}

# init plugin
exports.initPlugin = (server) ->
  jwtDefaultStrategy =
    key:          CONST.JWT_SECRET
    validateFunc: authUser

  plugins = [
    {register: require("hapi-auth-jwt2")}
  ]

  server.register plugins, (err) ->
    server.auth.strategy("jwtDefaultStrategy", "jwt", true, jwtDefaultStrategy)

# init route
exports.initRoute = (server, isAutomaticRouting) ->
  fs       = require "fs"
  path     = require "path"
  apiFiles = fs.readdirSync CONST.API_PATH

  if(isAutomaticRouting)
    for file in apiFiles then do (file) ->
      if path.extname(file) == ".coffee"
        filePath = CONST.API_PATH + "/" + file
        (require(filePath)).loadIndex server
  else
    require(CONST.API_PATH + "/auth.coffee"      ).loadIndex server
    require(CONST.API_PATH + "/building.coffee"  ).loadIndex server
    require(CONST.API_PATH + "/helloWorld.coffee").loadIndex server
    require(CONST.API_PATH + "/user.coffee"      ).loadIndex server

# hapi config validation example
exports.validation =
  validate:
    params:
      id: joi.string().min(3).max(5)
  auth:
    auth: "jwt"

# auth function
authUser = (decodedToken, req, callback) ->
#  console.log "Validate auth function called: decodedToken.foo: " + decodedToken.foo
  callback(null, true, {})
