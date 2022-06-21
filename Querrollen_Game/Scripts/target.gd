extends Node

export var id:int
export var description:String

signal player_entered(area_id)

func _ready():
	connect("player_entered", owner, "_on_player_entered")

func get_id():
	return id

func _on_player_entered(body):
	emit_signal("player_entered", id)
