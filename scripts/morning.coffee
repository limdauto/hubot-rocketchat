pg = require 'pg'
conString = "postgres://hubot:hubot@192.168.99.100/hubot"
dbClient = new pg.Client(conString)

module.exports = (robot) ->

    robot.respond /hey good morning/i, (res) ->
        today = new Date()
        res.reply 'Good morning! Today is #{today.toDateString()}'
        res.send 'Your priorities today are:'
        dbClient.connect (err) ->
            if err
                res.send 'Error: #{err}'
                return
            dbClient.query 'SELECT * FROM todo WHERE data = $1', [today], (err, result) ->
                res.send result.rows[0]
