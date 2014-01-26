wpi = require("wiring-pi")

class Motor
	
	constructor: (@enable, @in1, @in2, @name) ->
		@drive_cycle = 30
		wpi.setup()
		wpi.pinMode(@enable, wpi.modes.OUTPUT)
		wpi.pinMode(@in1, wpi.modes.OUTPUT)
		wpi.pinMode(@in2, wpi.modes.OUTPUT)
		@forward()

		console.log "initialized #{@name} Motor #{@enable}/#{@in1}/#{@in2}"

	reverse: =>
		wpi.digitalWrite(@in1, 1);
		wpi.digitalWrite(@in2, 0);

	forward: =>
		wpi.digitalWrite(@in1, 0);
		wpi.digitalWrite(@in2, 1);

	drive: (percent = 100) =>
		@timer = setInterval => 
    	@drive_pulse percent
    , @drive_cycle
    #wpi.digitalWrite(@enable, 1);

	drive_pulse: (percent) =>
		wpi.digitalWrite(@enable, 1);
		drive_time = (percent / 100) * @drive_cycle
		console.log "drive_time: #{drive_time} (%#{percent})"
		setTimeout =>
			wpi.digitalWrite(@enable, 0);
		, drive_time

	stop: () =>
		clearInterval(@timer)
		wpi.digitalWrite(@enable, 0);

module.exports = Motor