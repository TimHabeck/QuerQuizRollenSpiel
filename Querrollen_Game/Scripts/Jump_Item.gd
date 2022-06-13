extends Node

signal jump_item_found()
const effect = 300
const duration = 60

func _ready():
	connect("jump_item_found", owner, "timed_action")

func _on_player_entered(body):
	body.change_jump_speed(effect)
	var f = funcref(body, "change_jump_speed")
	emit_signal("jump_item_found", f, duration, [-1 * effect])
	self.queue_free()
