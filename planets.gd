extends "res://obstacles_parent.gd"




func _ready():
	
	asteroid_type = 1
	damage = 20
	score_value = 1
	
	var planets_sprite = $asteroids/asteroid_sprite
	var frame_names = planets_sprite.frames.get_animation_names()
	self.get_node("asteroids/asteroid_sprite").animation = frame_names[randi() % frame_names.size()]



func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
