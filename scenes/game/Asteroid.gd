extends CharacterBody2D


var player
var background_width
var background_height
var asteroid_origin
var asteroid_x
var asteroid_y
var asteroid_xy

func _ready():
	var background = get_node("/root/Game/Background").get_child(0).get_child(0)
	
	get_node("/root/Game/PlayerController").player_position.connect(_on_player_position)
	background_width = background.texture.get_width()
	background_height = background.texture.get_height()
	asteroid_origin = $Sprite2D
	asteroid_x = $SpriteX
	asteroid_y = $SpriteY
	asteroid_xy = $SpriteXY
	
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if position.x > background_width /2:
		position.x = -background_height /2
	if position.x < -background_width /2:
		position.x = background_width /2
	if position.y > background_height /2:
		position.y = -background_height /2
	if position.y < -background_height /2:
		position.y = background_height /2

func _on_player_position(x, y):
	if x > 0:
		asteroid_x.global_position.x = asteroid_origin.position.x + background_width
		asteroid_xy.global_position.x = asteroid_origin.position.x + background_width
	if x < 0:
		asteroid_x.global_position.x = asteroid_origin.position.x - background_width
		asteroid_xy.global_position.x = asteroid_origin.position.x - background_width
	if y > 0:
		asteroid_y.global_position.y = asteroid_origin.position.y + background_height
		asteroid_xy.global_position.y = asteroid_origin.position.y + background_height
	if y < 0:
		asteroid_y.global_position.y = asteroid_origin.position.y - background_height
		asteroid_xy.global_position.y = asteroid_origin.position.y - background_height
