extends Node

func _ready():
	for i in find_node("Background_Container").get_children():
		i.connect("player_entered", self, "_player_found_something")

func _player_found_something(area_id):
	pass
