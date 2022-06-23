extends Node

var patch:NinePatchRect
var desc_text:Label
var countdown=0
var counting=false

func _ready():
	patch = get_node("./CanvasLayer/container/NinePatchRect")
	desc_text = get_node("./CanvasLayer/description_label")
	description("")
	
func _process(delta):
	if counting:
		countdown-=delta
		if countdown<0:
			description("")
			counting=false
	
func new_texture(texture:Texture):
	patch.set_texture(texture)
	
func description(text:String):
	desc_text.set_text(text)
	countdown=15
	counting=true
