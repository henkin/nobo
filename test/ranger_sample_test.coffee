Ranger = new require("../pi/ranger")
ranger = new Ranger()
ranger.set_angle 75
result = ranger.get_distance_at_angle(-75, (first) -> console.log first)
result = ranger.get_distance_at_angle(0, (first) -> console.log first)
result = ranger.get_distance_at_angle(75, (first) -> console.log first)
