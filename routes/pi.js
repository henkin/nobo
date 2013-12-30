var ranger = require("ranger.js")
exports.index = function(req, res) {
//	res.send("wut");
	var range = ranger.getDistance();
	res.render('nobo', { title: range });
	
};

