Servo = require("./servo")
Sonar = require("./sonar")
ffi = require("node-ffi")

class Ranger
	constructor: () ->
		#console.log "initialized Ranger"
        @servo = new Servo()
        @sonar = new Sonar()

  get_distance: () =>
        @sonar.get_distance()

    #return Math.random()
    #RTLD_NOW = ffi.DynamicLibrary.FLAGS.RTLD_NOW
    #RTLD_GLOBAL = ffi.DynamicLibrary.FLAGS.RTLD_GLOBAL
    #mode = RTLD_NOW | RTLD_GLOBAL
    ##sonar = new ffi.DynamicLibrary(__dirname + "/libsonar.so", mode)
    #wiring = new ffi.DynamicLibrary(__dirname + "/libwiringPi.so", mode)
#   #   getDistance: ["double", ["int", "int"]]
    #
    #f = wiring.wiringInitGpio();
    #return sonar.getDistance();

    

	set_angle: (degrees) =>
		@servo.set_degrees(2, degrees)

module.exports = Ranger
