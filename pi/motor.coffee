Servo = require("./servo")
wpi = require("wiring-pi")

class Motor
	
	constructor: (@servoNumber, @in1, @in2) ->
		@servo = new Servo();
		wpi.setup()
		wpi.pinMode(@in1, wpi.modes.OUTPUT)
		wpi.pinMode(@in2, wpi.modes.OUTPUT)
		@reverse()

		console.log "initialized Motor"

	forward: =>
		wpi.digitalWrite(@in1, 1);
		wpi.digitalWrite(@in2, 0);

	reverse: =>
		wpi.digitalWrite(@in1, 0);
		wpi.digitalWrite(@in2, 1);

	drive: (pulse) =>
		@servo.set_pulse(@servoNumber, pulse);

module.exports = Motor