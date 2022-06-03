extends Node

export (Array, Texture) var images

var interface:Control

onready var targets = [
	{"id":"1:1","img":images[0]},
	{"id":"1:14","img":images[1]},
	{"id":"2:2","img":images[2]},
	{"id":"5:5","img":images[3]}
	]
	
var current_target:String

func _ready():
	for i in find_node("Background_Container").get_children():
		i.connect("player_entered", self, "_player_found_something")
		
	interface = get_node("./KinematicBody2D/Interface")
	
	new_task(targets[0])
	targets.remove(0)

func _player_found_something(area_id):
	if area_id == current_target:
		new_task(targets[0])
		targets.remove(0)
	
func new_task(target):
	var id = target["id"]
	var img = target["img"]
	
	current_target = id
	interface.new_texture(img)
