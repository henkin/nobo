Ranger = require "../pi/ranger"

class Pi
  constructor: (@io) ->
    @ranger = new Ranger()

  index: (req, res) =>
    range = @ranger.getDistance()

    @io.sockets.on 'connection', (socket) =>
      socket.emit 'pi', "connected"

      #start broadcast
      @timer = setInterval => 
        @distance(socket)
      , 1000

      # stop firing when disconnected
      socket.on 'disconnect', () =>
        console.log "client dropped, stopping"
        clearInterval(@timer)
      
    res.render "index",
      title: "Pi"

  debug: (req, res) =>
    res.json @ranger.getDistance()

  distance: (socket) =>
    #console.log "sending"
    socket.emit 'pi', { from: @ranger.getDistance()}
    
module.exports = Pi
