extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var camera_size = get_viewport_rect().size
	var background = get_node("/root/Game/Background")
	var background_sprite = background.get_child(0).get_child(0)

	limit_left = -background_sprite.texture.get_width() /2
	limit_right = background_sprite.texture.get_width() /2
	limit_top = -background_sprite.texture.get_height() /2
	limit_bottom = background_sprite.texture.get_height() /2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
