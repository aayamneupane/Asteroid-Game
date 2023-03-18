extends Control


var config = ConfigFile.new()
var current_ship
var saved_high_score = File.new()
func _ready():
	
	var err = config.load("res://settings.cfg")

	if (err == OK):
		for ship_data in config.get_sections():
			current_ship = config.get_value("selected_ship", "ship_data")
		Global.selected_ship = current_ship
	else:
		Global.selected_ship = Global.ship_classification[1]
	
	
	if (saved_high_score.file_exists("user://high_score.save")):
		saved_high_score.open("user://high_score.save", File.READ)
		Global.high_score = saved_high_score.get_16()
	else:
		saved_high_score.open("user://high_score.save", File.WRITE)
		saved_high_score.store_16(0)
		Global.high_score = 0
	saved_high_score.close()
	

func _on_space_station_button_pressed():
	get_tree().change_scene("res://space_station.tscn")


func _on_start_button_pressed():
	get_tree().change_scene("res://Main.tscn")

func _on_quit_button_pressed():
	get_tree().quit() 
