extends Node2D


const MIN_SPEED = 10.0
const MAX_SPEED = 100.0
const asteroid_scene = preload("res://scenes/game/asteroid_large.tscn")

var rng = RandomNumberGenerator.new()
var num_asteroids = 5
var game
var asteroid
var speed

# Called when the node enters the scene tree for the first time.
func _ready():
	game = get_parent()
	for i in num_asteroids:
		spawn_asteroid()

func spawn_asteroid():
	asteroid = asteroid_scene.instantiate()
	speed = rng.randi_range(MIN_SPEED , MAX_SPEED)
	asteroid.position.x = rng.randf_range(-960, 960)
	asteroid.position.y = rng.randf_range(-540, 540)
	asteroid.rotation = rng.randf_range(0 , 3.141592)
	asteroid.velocity = asteroid.transform.x * speed
	game.add_child.call_deferred(asteroid)
