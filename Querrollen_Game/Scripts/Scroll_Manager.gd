extends Node

export var scroll_id:int

signal player_entered(area_id)

func _ready():
	var Areas = get_tree().get_nodes_in_group ("Areas")
	
func _on_player_entered(area_id):
	var combined_id = str(scroll_id) + ":" + str(area_id)
	print(combined_id)
	emit_signal("player_entered", combined_id)
