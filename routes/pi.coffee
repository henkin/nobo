Ranger = require "../pi/ranger"

class Pi
  constructor: (@io) ->
    @ranger = new Ranger()
    @io.sockets.on 'connection', (socket) =>
      socket.emit 'pi', "connected"

      #start broadcast
      @timer = setInterval => 
        @emit_distance(socket)
      , 400

      # stop firing when disconnected
      socket.on 'disconnect', () =>
        console.log "client dropped, stopping"
        clearInterval(@timer)

  index: (req, res) =>
    range = @ranger.get_distance()

    res.render "index",
      title: "Pi"

  set_angle: (req, res) =>
    angle = Number(req.body.angle)
    console.log "POST sent_angle: #{angle}"
    @ranger.set_angle(angle)
    @io.sockets.emit 'angle_set', angle
    res.end()

  emit_distance: (socket) =>
    distance = @ranger.get_distance()
    socket.emit 'distance', distance

module.exports = Pi
