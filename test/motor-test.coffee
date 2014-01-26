Motor = new require("../pi/motor")
sleep = require('sleep');

test = (motor) ->
	motor.drive();
	sleep.sleep(1);
	motor.stop();
	sleep.sleep(1);
	motor.reverse();
	motor.drive();
	sleep.sleep(1);
	motor.stop();

right = new Motor(2, 8, 9, "right")
#test(right)


left = new Motor(0, 6, 3, "left")
#test(left)

right.drive(30);
left.drive(30);

setTimeout ->
	right.stop()
	left.stop()
, 2000


