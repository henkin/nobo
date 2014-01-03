Servo = require("./servo")
ffi = require("node-ffi")

class Ranger
	constructor: () ->
		console.log "initialized Ranger"
		@servo = new Servo()
		@sonar = new ffi.Library(__dirname + "/libsonar.so",
			init : [ "void", [ "int", "int" ] ] 
			get_distance : [ "float", [] ]
		)
		@sonar.init(23, 24)

	get_distance: () =>
		# @sonar.get_distance()
		return @sonar.get_distance()
		#   #   getDistance: ["double", ["int", "int"]]
		#
		#f = wiring.wiringInitGpio();
		#return sonar.getDistance();
		#return Math.random()

	set_angle: (degrees) =>
		@servo.set_degrees(2, degrees)

module.exports = Ranger
