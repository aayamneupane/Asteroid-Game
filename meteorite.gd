extends "res://obstacles_parent.gd"




func _ready():
	pass



func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()      
