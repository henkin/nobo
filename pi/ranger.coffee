Servo = require("./servo")

class Ranger
	constructor: () ->
		#console.log "initialized Ranger"
    @servo = new Servo()
	
  getDistance: () =>
    Math.random()

	setAngle: (degrees) =>
		@servo.set_degrees(2, degrees)

module.exports = Ranger