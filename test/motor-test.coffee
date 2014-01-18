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

right.drive();
left.drive();
sleep.sleep(2);
left.stop();
right.stop();

sleep.sleep(1);
right.reverse();
left.reverse();

right.drive();
left.drive();
sleep.sleep(2);

left.stop();
right.stop();



