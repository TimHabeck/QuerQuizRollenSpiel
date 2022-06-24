extends Node

var enemy_scene = preload("res://Szenes/Enemy.tscn")
# Called when the node enters the scene tree for the first time.
onready var spawn_points = [
	{"x":-2817,"y":32},
	{"x":1052,"y":32},
	{"x":8179,"y":32},
	{"x":-2953,"y":544},
	{"x":3787,"y":544},
	{"x":9420,"y":544},
	{"x":5569,"y":1100},
	]
	
func _ready():
	for spawn in spawn_points:
		var enemy = enemy_scene.instance()
		enemy.position.x = spawn.x
		enemy.position.y = spawn.y
		add_child(enemy)


