extends Node

var patch:NinePatchRect
var desc_text:Label
var light_label:Label
var jump_label:Label
var score_label:Label

var countdown=0
var counting=false

var light_countdown=1
var light_on=true

var jump_countdown=1
var jump_on=true

func _ready():
	patch = get_node("./CanvasLayer/container/NinePatchRect")
	desc_text = get_node("./CanvasLayer/description_label")
	light_label = get_node("./CanvasLayer/light_label")
	jump_label = get_node("./CanvasLayer/jump_label")
	score_label = get_node("./CanvasLayer/score_label")
	
	
	description("")
	
func _process(delta):
	if counting:
		countdown-=delta
		if countdown<0:
			description("")
			counting=false
			
	if jump_on:
		jump_countdown-=delta
		if jump_countdown<0:
			jump_label.set_text("")
			jump_on=false
		else:
			var jump_text = "Longjump: " + str(int(round(jump_countdown)))
			jump_label.set_text(jump_text)
			
	if light_on:
		light_countdown-=delta
		if light_countdown<0:
			light_label.set_text("")
			light_on=false
		else:
			var light_text = "Light: " + str(int(round(light_countdown)))
			light_label.set_text(light_text)
	
func new_texture(texture:Texture):
	patch.set_texture(texture)
	
func description(text:String):
	desc_text.set_text(text)
	countdown=15
	counting=true
	
func _light_on():
	print("light on")
	light_countdown += 15
	light_on = true
	
func _jump_on():
	print("jump on")
	jump_countdown += 15
	jump_on = true
	
func _update_score(score):
	var text = "Score: " + str(int(round(score)))
	score_label.set_text(text)
	
	
	
	
	
	
	
