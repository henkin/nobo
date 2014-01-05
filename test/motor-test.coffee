Motor = new require("../pi/motor")
motor = new Motor(7, 8, 9)
sleep = require('sleep');
motor.drive(200);
sleep.sleep(3);
motor.drive(0);