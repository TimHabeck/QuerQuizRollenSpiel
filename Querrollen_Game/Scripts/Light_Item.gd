extends Node

signal light_item_found()
signal light_sign_on()

const effect = 3
const duration = 15

func _ready():
	connect("light_item_found", owner, "timed_action")
	connect("light_sign_on", owner, "_light_on")
	

func _on_player_entered(body):
	body.change_light_size(effect)
	var f = funcref(body, "change_light_size")
	emit_signal("light_item_found", f, duration, [-1 * effect])
	emit_signal("light_sign_on")
	self.queue_free()
