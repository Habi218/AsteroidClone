extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport = get_viewport_rect().size
	var button = get_child(0)
	
	button.size = viewport

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	#get_tree().change_scene_to_file("res://scenes/game/game.tscn")
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")
