wpi = require("wiring-pi")

class Motor
	
	constructor: (@enable, @in1, @in2) ->
		wpi.setup()
		wpi.pinMode(@enable, wpi.modes.OUTPUT)
		wpi.pinMode(@in1, wpi.modes.OUTPUT)
		wpi.pinMode(@in2, wpi.modes.OUTPUT)
		@forward()

		console.log "initialized Motor #{@enable}/#{@in1}/#{@in2}"

	forward: =>
		wpi.digitalWrite(@in1, 1);
		wpi.digitalWrite(@in2, 0);

	reverse: =>
		wpi.digitalWrite(@in1, 0);
		wpi.digitalWrite(@in2, 1);

	drive: () =>
		wpi.digitalWrite(@enable, 1);

	stop: () =>
		wpi.digitalWrite(@enable, 0);

module.exports = Motor