extends Node

export var scroll_id:int

signal player_entered(area_id)

func _on_player_entered(area_id):
	emit_signal("player_entered", area_id)
