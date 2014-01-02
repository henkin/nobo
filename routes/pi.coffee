Ranger = require "../pi/ranger"

class Pi
  constructor: (@io) ->
    @ranger = new Ranger()
    @io.sockets.on 'connection', (socket) =>
      socket.emit 'pi', "connected"

      #start broadcast
      @timer = setInterval => 
        @emit_distance(socket)
      , 1000

      # stop firing when disconnected
      socket.on 'disconnect', () =>
        console.log "client dropped, stopping"
        clearInterval(@timer)

  index: (req, res) =>
    range = @ranger.get_distance()

    res.render "index",
      title: "Pi"

  debug: (req, res) =>
    res.json @ranger.get_distance()

  set_angle: (req, res) =>
    angle = req.body.angle
    console.log "pi: set_angle #{angle}"
    @io.sockets.emit 'angle_set', angle

  emit_distance: (socket) =>
    socket.emit 'distance', @ranger.get_distance()

module.exports = Pi
