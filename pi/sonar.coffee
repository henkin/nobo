#fs = require("fs")
wpi = require("wiring-pi")

class Sonar
    constructor:() ->
        console.log wpi
        @trigger_pin = 23 
        @ECHO_PIN = 24 
        @TIMEOUT = 999 
        wpi.setup('gpio')
        wpi.pinMode(@trigger_pin, wpi.modes.OUTPUT)
	wpi.pinMode(24, wpi.modes.INPUT)

	get_distance: () ->
	    #/* trigger reading */
	    wpi.digitalWrite(triggerPin, HIGH);
	    #waitforpin(echoPin, TIMEOUT, 10); /* wait 10 microseconds */
	    #digitalWrite(triggerPin, LOW);
	    #/* wait for reading to start */
	    #waitforpin(echoPin, HIGH, 5000); /* 5 ms timeout */
	    #if (digitalRead(echoPin) == HIGH)
	    #{
		#    pulsewidth = waitforpin(echoPin, LOW, 60000L); /* 60 ms timeout */
		#    if (digitalRead(echoPin) == LOW)
		#    {
		#	    /* valid reading code */
		#	    float distance = ((float)pulsewidth / (float)29) / (float)2;
		#	    //printf("echo at %d micros (%f)\n", pulsewidth, distance);
		#	    return distance;
		#    }
		#    else
		#    {
		#	    /* no object detected code */
		#	    //printf("echo timed out\n");
		#	    return -1;
		#    }
	    #}
	    #else
	    #{
		#    /* sensor not firing code */
		#    //printf("sensor didn't fire\n");
		#    return -1;
	    #}
	    #return 0;
   
        
module.exports = Sonar
