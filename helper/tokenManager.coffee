# author : meinzug@me.com : 2015.03.31 12:21

# load module
jwt   = require "jsonwebtoken"
cache = require "memory-cache"

# functions
getUTCTimeStamp = () ->
  return datefn(new Date(), "yyyy-mm-dd HH:MM:ss Z", true)

exports.makeToken = () ->
  token = jwt.sign {}, CONST.JWT_SECRET, {expiresInSeconds: CONST.SECOND_DAY}
  console.log "TKM: set: " + token
  return token

exports.put = (key) ->
  cache.put(key, getUTCTimeStamp, CONST.MILLISECOND_DAY)
  console.log "TKM: set: " + key
  return key

exports.exist = (key) ->
  if not cache.get(key)
    console.log "TKM: not exist: " + key
    return null

  console.log "TKM: exist: " + key
  return true

exports.delete = (key) ->
  if not cache.del(key)
    console.log "TKM: not delete: " + key
    return false;

  console.log "TKM: delete: " + key
  return true

#{
#  keys   : {count},  global key count
#  hits   : {count},  global hit count
#  misses : {count},  global miss count
#  ksize  : {count},  global key size count
#  vsize  : {count}   global value size count
#}
exports.getStatus = getStatus = () ->
  return cache.getStats()