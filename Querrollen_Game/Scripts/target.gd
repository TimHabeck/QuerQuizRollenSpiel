extends Node

export var id:int
export var description:String
export var thumbnail:Texture

signal player_entered(area_id)
signal startup_registering(area_id, description, thumbnail)

func _ready():
	connect("player_entered", owner, "_on_player_entered")
	connect("startup_registering", owner, "_target_registered")
	yield(get_tree().create_timer(0.1), "timeout")
	emit_signal("startup_registering", id, description, thumbnail)

func get_id():
	return id

func _on_player_entered(body):
	emit_signal("player_entered", id)
