Servo = require("./servo")
ffi = require("node-ffi")

class Ranger
	constructor: () ->
		#console.log "initialized Ranger"
    @servo = new Servo()
	
  get_distance: () =>
    #return Math.random()
    sonar = new ffi.Library(__dirname + "/libsonar",
      getDistance: ["double", ["int", "int"]]
    )
    return sonar.getDistance();

	set_angle: (degrees) =>
		@servo.set_degrees(2, degrees)

module.exports = Ranger
