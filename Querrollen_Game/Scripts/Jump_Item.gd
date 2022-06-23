extends Node

signal jump_item_found()
const effect = 1000
const duration = 15

func _ready():
	connect("jump_item_found", owner, "timed_action")

func _on_player_entered(body):
	body.change_gravity(effect)
	print("gravity")
	var f = funcref(body, "change_gravity")
	emit_signal("jump_item_found", f, duration, [-1 * effect])
	self.queue_free()
