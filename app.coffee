# author : meinzug@me.com : 2015.02.06 11:51

# load module : KEEP the ORDER !!
hapi                = require "hapi"
global.datefn       = require "dateformat"
global.jwt          = require "jsonwebtoken"
global.uuid         = require "node-uuid"
global.CONST        = require "./helper/constant.coffee"
global.db           = require "./helper/mysqlHelper.coffee"
global.hapiHelper   = require "./helper/hapiHelper.coffee"
global.tokenManager = require "./helper/tokenManager.coffee"

# init helper
db.initDbms()

# init hapi
server = new hapi.Server()
hapiHelper.initConnection(server)
hapiHelper.initPlugin(server)
hapiHelper.initRoute(server, true)



# run hapi
server.start()

# start log
console.log "======================================================"
console.log "Umanji Map Server Started.."
console.log CONST.SERVER_BOOTUP_UTC
console.log CONST.SERVER_BOOTUP_LOC
console.log "Timestamp: " + CONST.SERVER_BOOTUP_MILLI + "\n"
console.log "http://" + CONST.SERVER_HOST + ":" + CONST.SERVER_PORT
console.log "uuid: " + CONST.SERVER_UUID
console.log "======================================================"
