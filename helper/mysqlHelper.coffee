# author : meinzug@me.com : 2015.02.24 15:41

# load module
promise   = require "bluebird"
mysql     = require "mysql"
mysqlPool = null

# common operations
exports.initDbms = () ->
  config =
    host              : CONST.MYSQL_HOST
    port              : CONST.MYSQL_PORT
    user              : CONST.MYSQL_USER
    password          : CONST.MYSQL_PASSWORD
    database          : CONST.MYSQL_DATABASE
    connectionLimit   : CONST.MYSQL_CONNECTION_LIMIT
    waitForConnections: CONST.MYSQL_WAIT_FOR_CONNECTIONS
  mysqlPool = mysql.createPool(config)

exports.getRecords = (table) ->
  new promise((resolve, reject) ->
    sql = "select * from #{table}"

    mysqlPool.getConnection((err, conn) ->
      conn.query(sql, (err, rows) ->
        if err
          conn.release()
          reject(throw err)

        conn.release()
        resolve(rows)
      )
    )
  )




