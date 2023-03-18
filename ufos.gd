extends "res://obstacles_parent.gd"


onready var ufo_sprite = $asteroids/asteroid_sprite

func _ready():

	var frame_names = ufo_sprite.frames.get_animation_names()
	self.get_node("asteroids/asteroid_sprite").animation = frame_names[randi() % frame_names.size()] 
	



func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
