assert = require("assert")
Ranger = new require("../pi/ranger")
describe "Ranger", ->
  ranger = new Ranger()
  describe "get_distance", ->
    it "should return a number", ->
      assert.equal 75, ranger.get_distance()
