extends Node

var patch:NinePatchRect

func _ready():
	patch = get_child(0).get_child(0).get_child(1)
	
func new_texture(texture:Texture):
	patch.set_texture(texture)
	
