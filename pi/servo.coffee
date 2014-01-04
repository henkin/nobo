fs = require("fs")

class Servo
	get_usecs: (degrees) ->
		if degrees < -75 or degrees > 75
			console.log "servo.get_usecs: invalid degrees: #{degrees}" 
		else
			return ((degrees + 90) + 60)

	center: (servo) -> @set_degrees(servo, 0)
	
	set_degrees: (servo, degrees) ->
		usecs = @get_usecs(degrees)
		console.log "setting #{servo} to #{usecs}"

		stream = fs.createWriteStream("/dev/servoblaster");
		stream.once 'open', (fd) ->
			stream.write("#{servo}=#{usecs}\n")
			stream.end

module.exports = Servo