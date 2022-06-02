extends Node

export var thumbnail:Texture
export var id:int

func _ready():
	pass
	
func get_thumbnail():
	return thumbnail

func get_id():
	return id

func _on_player_entered(body):
	print(body) # Replace with function body.
