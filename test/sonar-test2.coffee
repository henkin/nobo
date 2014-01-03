assert = require("assert")
Ranger = new require("../pi/sonar")
describe "Sonar", ->
  ranger = new Sonar()
  describe "get_distance", ->
    it "should return a number", ->
      assert.equal 75, ranger.get_distance()
