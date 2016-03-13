pg = require 'pg'
conString = "postgres://hubot:hubot@192.168.99.100/database"

module.exports = {
    client: () -> new pg.Client(conString)
}
