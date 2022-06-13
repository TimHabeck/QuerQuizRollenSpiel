extends Node

signal light_item_found()
const effect = 5
const duration = 60

func _ready():
	connect("light_item_found", owner, "timed_action")

func _on_player_entered(body):
	body.change_light_size(effect)
	var f = funcref(body, "change_light_size")
	emit_signal("light_item_found", f, duration, [-1 * effect])
	self.queue_free()
