extends Node

signal jump_item_found()
signal jump_sign_on()

const effect = 1000
const duration = 15

func _on_player_entered(body):
	body.change_gravity(effect)
	var f = funcref(body, "change_gravity")
	emit_signal("jump_item_found", f, duration, [-1 * effect])
	emit_signal("jump_sign_on")
	self.queue_free()
