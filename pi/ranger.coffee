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
		@sonar.init(4, 5)
		@set_angle(0)

	get_distance: () =>
		# @sonar.get_distance()
		distance = 0
		while distance <= 0
			distance = @sonar.get_distance()
		return distance

	get_distance_at_angle: (angle, fn) =>
		@set_angle(angle)
		setTimeout(=>
			fn({ angle: angle, distance: @get_distance_sample() })
			500
			)
		return

	get_distance_sample: () =>
		max = 8
		sample = (@get_distance() for num in [1..max])
		console.log sample
		sample.sort()
		mean = sample[max/2]
		console.log mean
		cluster = (valid for valid in sample when Math.abs(valid - mean) < 3)
		return (cluster.reduce (x,y) -> x + y) / cluster.length

	set_angle: (degrees) =>
		@current_angle = degrees
		@servo.set_degrees(2, degrees)

module.exports = Ranger
