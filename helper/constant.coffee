# author : meinzug@me.com : 2015.02.27 07:29

# milliseconds
exports.MILLISECOND_SEC   = MILLISECOND_SEC   = 1000        # 1000 (millisec to 1 sec)
exports.MILLISECOND_MIN   = MILLISECOND_MIN   = 60000       # 1000 * 60
exports.MILLISECOND_HOUR  = MILLISECOND_HOUR  = 3600000     # 1000 * 60 * 60
exports.MILLISECOND_DAY   = MILLISECOND_DAY   = 86400000    # 1000 * 60 * 60 * 24
exports.MILLISECOND_YEAR  = MILLISECOND_YEAR  = 31536000000 # 1000 * 60 * 60 * 24 * 365

exports.SECOND_MIN        = SECOND_MIN        = 60          # 60 (sec to 1 min)
exports.SECOND_HOUR       = SECOND_HOUR       = 3600        # 60 * 60
exports.SECOND_DAY        = SECOND_DAY        = 86400       # 60 * 60 * 24
exports.SECOND_YEAR       = SECOND_YEAR       = 31536000    # 60 * 60 * 24 * 365

# server connection
exports.SERVER_HOST         = "0.0.0.0"
exports.SERVER_PORT         = 8080
exports.SERVER_UUID         = uuid.v4()
exports.SERVER_BOOTUP_UTC   = datefn(new Date(), "yyyy-mm-dd HH:MM:ss Z", true)
exports.SERVER_BOOTUP_LOC   = datefn(new Date(), "yyyy-mm-dd HH:MM:ss Z", false)
exports.SERVER_BOOTUP_MILLI = new Date().getTime()

# token
exports.JWT_SECRET        = "One for All. One for All."
exports.JWT_BEARER_PREFIX = "Bearer "

# mysql, mariadb
exports.MYSQL_HOST                = "localhost"
exports.MYSQL_PORT                = 3306
exports.MYSQL_USER                = "umanji"
exports.MYSQL_PASSWORD            = "18281828"
exports.MYSQL_DATABASE            = "master1"
exports.MYSQL_CONNECTION_LIMIT    = 20
exports.MYSQL_WAIT_FOR_CONNECTIONS= false

# database
exports.TBL_USER     = "tbl_user"
exports.TBL_BUILDING = "tbl_building"

# path
exports.API_PATH = require("app-root-path") + "/api"