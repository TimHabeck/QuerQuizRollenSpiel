extends Node

signal player_entered(area_id)

func _on_player_entered(area_id):
	print("signal out scroll")
	emit_signal("player_entered", area_id)
