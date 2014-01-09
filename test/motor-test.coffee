Motor = new require("../pi/motor")

test = (motor) ->
	sleep = require('sleep');
	motor.drive();
	sleep.sleep(1);
	motor.stop();
	sleep.sleep(1);
	motor.reverse();
	motor.drive();
	sleep.sleep(1);
	motor.stop();

m = new Motor(2, 8, 9)
test(m)


m = new Motor(0, 6, 3)
test(m)

