assert = require("assert")
Servo = new require("../pi/servo")
describe "Servo", ->
  servo = new Servo()
  describe "get_usecs", ->
    it "should return valid number if between -75 and 75", ->
      assert.equal 75, servo.get_usecs(-75)
      assert.equal 150, servo.get_usecs(0)
      assert.equal 225, servo.get_usecs(75)
      assert.equal undefined, servo.get_usecs(-90)
  describe "write_pulse", ->
    it "should write pulse to servoblaster", ->
      #servo.set_degrees(2, 25)
