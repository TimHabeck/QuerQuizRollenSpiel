extends Node

export (Array, Texture) var images

onready var interface:Control = get_node("./KinematicBody2D/Interface")

var targets = []
	
var current_target:String

func _ready():
	randomize()
	connect_scroll_signals()
	start_task()

	
func start_task():
	yield(get_tree().create_timer(0.2), "timeout")
	var number = floor(rand_range(0, len(targets)))
	new_task(targets[number])
	targets.remove(number)
	
func connect_scroll_signals():
	for i in find_node("Background_Container").get_children():
		i.connect("player_entered", self, "_player_found_something")
		i.connect("target_registered", self, "_target_message")
	
func new_task(target):
	var id = target["id"]
	var img = target["img"]
	
	current_target = id
	interface.new_texture(img)

func timed_action(f : FuncRef, time, args=[]):
	yield(get_tree().create_timer(float(time)), "timeout")
	f.call_funcv(args)

func _player_found_something(area_id):
	if area_id == current_target:
		var number = floor(rand_range(0, len(targets)))
		new_task(targets[number])
		targets.remove(number)
	
func _target_message(id, desc, img):
	targets.append({"id":id, "desc":desc, "img":img})
	
