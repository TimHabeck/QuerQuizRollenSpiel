extends Node

export (Array, Texture) var images

onready var interface:Control = get_node("./KinematicBody2D/Interface")

var targets = []
	
var current_target:float

func _ready():
	randomize()
	connect_scroll_signals()
	yield(get_tree().create_timer(0.2), "timeout")
	new_task()
	
func connect_scroll_signals():
	for i in find_node("Background_Container").get_children():
		i.connect("player_entered", self, "_player_found_something")
		i.connect("target_registered", self, "_target_message")
	
func new_task():
	var number = floor(rand_range(0, len(targets)))
	current_target = number
	
	var img = targets[number]["img"]
	interface.new_texture(img)

func timed_action(f : FuncRef, time, args=[]): #Used for items. This function can reverse effects after the item has been deleted
	yield(get_tree().create_timer(float(time)), "timeout")
	f.call_funcv(args)

func _player_found_something(area_id):
	if area_id == targets[current_target]["id"]:
		var desc = targets[current_target]["desc"]
		interface. description(desc)
		targets.remove(current_target)
		new_task()
	
func _target_message(id, desc, img):
	if img:
		targets.append({"id":id, "desc":desc, "img":img})
	
func _light_on():
	interface._light_on()
	
func _jump_on():
	interface._jump_on()
