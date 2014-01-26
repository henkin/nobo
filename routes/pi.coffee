Ranger = require "../pi/ranger"
Motor = new require("../pi/motor")

class Pi
  constructor: (@io) ->
    @ranger = new Ranger()
    @right = new Motor(2, 8, 9, "right")
    @left = new Motor(0, 6, 3, "left")

    @io.sockets.on 'connection', (socket) =>
      socket.emit 'pi', "connected"

      #start broadcast
      @timer = setInterval => 
        @emit_distance(socket)
      , 400

      socket.on 'drive', (data) => @drive(data)
      socket.on 'stop', (side) => @stop(side)

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

  drive: (data) =>
    motor = @[data.side]
    #console.error motor
    #@right.drive(30);
    #@left.drive(30);
    motor[data.dir]()
    motor.drive(20)
    
    #setTimeout =>
      #@right.stop()
      #@left.stop()
    #  motor.stop()
    #, 1000

  stop: (side) =>
    motor = @[side]
    #console.error motor
    motor.stop()
    
module.exports = Pi
