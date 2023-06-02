extends CharacterBody2D


const SPEED = 1500.0

var player

func _ready():
	player = get_node("/root/Game/PlayerController")
	rotation_degrees = player.rotation_degrees + 90
	global_position = player.position
	velocity = -transform.y * SPEED + player.velocity

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		queue_free()
		collision.get_collider().queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
