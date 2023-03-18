extends Control


func _ready():

	$descriptions.text = """What is Lorem Ipsum?
	Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
	Richard McClintock, a Latin professor at Hampden-Sydney College in """

	var config = ConfigFile.new()
	config.set_value("selected_ship", "ship_data", Global.selected_ship)
	config.save("res://settings.cfg")

func _on_space_ship1_mouse_entered():
	$descriptions.text = """This is a cool spaceship, 
	small and fast.
	Agility = 3, 
	Speed = 3x, 
	Defense = 200"""


func _on_space_ship2_mouse_entered():
	$descriptions.text = """
	This is the COOLEST spaceship. 
	DEVELOPER's CHOICE.
	All rounder Stats.
	Agility = 2, 
	Speed = 2x, 
	Defense = 400
	"""


func _on_space_ship3_mouse_entered():
	$descriptions.text = """This is just a spaceship.
	Slow as hell. 
	If you want a flying tank choose this spaceship.
	Agility = 1, 
	Speed = 1x, 
	Defense = 1000"""



func _on_back_button_pressed():

	get_tree().change_scene("res://UI.tscn")

func _on_space_ship1_pressed():
	Global.selected_ship = Global.ship_classification[0]
	var config = ConfigFile.new()
	config.set_value("selected_ship", "ship_data", Global.selected_ship)
	config.save("res://settings.cfg")

func _on_space_ship2_pressed():
	Global.selected_ship = Global.ship_classification[1]
	var config = ConfigFile.new()
	config.set_value("selected_ship", "ship_data", Global.selected_ship)
	config.save("res://settings.cfg")


func _on_space_ship3_pressed():
	Global.selected_ship = Global.ship_classification[2]
	var config = ConfigFile.new()
	config.set_value("selected_ship", "ship_data", Global.selected_ship)
	config.save("res://settings.cfg")
	
