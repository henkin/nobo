Ranger = require "../pi/ranger"

exports.index = (req, res) ->
  #	res.send("wut");
  range = new Ranger().getDistance()
  res.render "index",
    title: range

exports.debug = (req, res) ->
  #range = ranger.getDistance()
  res.json new Ranger().getDistance()
    

