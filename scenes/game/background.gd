extends Node2D


var width
var height
var background_x
var background_xy
var background_y

# Called when the node enters the scene tree for the first time.
func _ready():
	background_x = get_node("/root/Game/Background").get_child(0).get_child(1)
	background_xy = get_node("/root/Game/Background").get_child(0).get_child(2)
	background_y = get_node("/root/Game/Background").get_child(0).get_child(3)
	width = background_x.texture.get_width()
	height = background_x.texture.get_width()

func _on_player_controller_player_position(x, y):
	if x > 0:
		background_x.position.x = width
		background_xy.position.x = width
	if x < 0:
		background_x.position.x = -width
		background_xy.position.x = -width
	if y > 0:
		background_y.position.y = height
		background_xy.position.y = height
	if y < 0:
		background_y.position.y = -height
		background_xy.position.y = -height
