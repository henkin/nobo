fs = require("fs")

class Servo
	get_usecs: (degrees) ->
		if degrees < -75 or degrees > 75
			console.log "servo.get_usecs: invalid degrees: #{degrees}" 
		else
			((degrees + 90) + 60)

	center: (servo) -> @set_degrees(servo, 0)
	
	set_degrees: (servo, degress) ->
		usecs = @get_usecs(degress)
		console.log "setting #{servo} to #{usecs}"

		fs.writeFile "/dev/servoblaster", "#{servo}=#{usecs}\n", (err) ->
		  if err
		    console.log err
		  #else
		  # console.log "servo: The file was saved!"
module.exports = Servo