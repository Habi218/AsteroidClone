extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_input():
	if Input.is_action_just_pressed("Esc"):
		get_tree().quit()

func _process(delta):
	get_input()
