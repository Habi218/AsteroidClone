extends CharacterBody2D


const BULLET_SCENE = preload("res://scenes/game/bullet.tscn")
const SPEED = 10.0
const MAX_SPEED = 700.0
const ROT_SPEED = .07

signal player_position(x, y)

var background

func _ready():
	background = get_node("/root/Game/Background").get_child(0).get_child(0)

func get_input():
	velocity += transform.x * Input.get_axis("s", "w") * SPEED
	
	if (velocity.x * velocity.x) + (velocity.y * velocity.y) > (MAX_SPEED * MAX_SPEED):
		velocity = velocity.normalized() * MAX_SPEED
	if Input.is_action_pressed("a"):
		rotation -= ROT_SPEED
	if Input.is_action_pressed("d"):
		rotation += ROT_SPEED

	if Input.is_action_just_pressed("Space"):
		var new_bullet = BULLET_SCENE.instantiate()
		get_node("/root/Game/Bullets").add_child(new_bullet)

func _physics_process(delta):
	get_input()
	move_and_slide()
	
	# Teleport the player to the opposite end when moving past bounds
	if position.x > background.texture.get_width() /2:
		position.x = -background.texture.get_width() /2
	if position.x < -background.texture.get_width() /2:
		position.x = background.texture.get_width() /2
	if position.y > background.texture.get_height() /2:
		position.y = -background.texture.get_height() /2
	if position.y < -background.texture.get_height() /2:
		position.y = background.texture.get_height() /2

func _process(delta):
	player_position.emit(position.x, position.y)
