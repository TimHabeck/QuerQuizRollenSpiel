extends Sprite


# Declare member variables here. Examples:
var image_size
var image_offset = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	fit_background()
	get_tree().get_root().connect("size_changed", self, "fit_background")
	
func fit_background():
	#Scale Background
	image_size = texture.get_size()
	var screen_size = get_viewport().get_visible_rect().size
	var image_scale = transform.get_scale().y
	print("old scale: " + str(image_scale))
	image_scale = screen_size.y / (image_size.y * image_scale)
	print("image_scale: " + str(image_scale))
	transform = transform.scaled(Vector2(image_scale, image_scale))

	print("new scale: " + str(image_scale))

	#Offset
	image_offset = image_size / 2 - image_offset
	transform = transform.translated(image_offset)
	

#func _process(delta):
#	pass
