extends Control

export (PackedScene) var obstacle_1_scene

export (PackedScene) var obstacle_2_scene

export (PackedScene) var obstacle_3_scene


var rng = RandomNumberGenerator.new()
var score = 0
var constant_speed = Global.selected_ship["Speed"]
var normal_speed:int 
var scroll_speed: float = constant_speed 


onready var bg = $ParallaxBackground
onready var difficulty_button = $HUD/difficulty_mode/difficulty_mode_button
onready var obstacles_timer = get_node("obstacles_timer")
onready var constant_wait_time = 2
onready var spawn_location = $obstacles_spawn/spawn_location
#onready var ufo_timer = 

func _ready():
	randomize() 
	normal_speed = constant_speed * 0.9
	scroll_speed = normal_speed

	rng.randomize()
	var player = get_node("player") 
	player.position = Vector2(240, 600)
	

	
func _process(delta):
	bg.scroll_offset.y += scroll_speed * delta
	_normal_mode()
	if (Input.is_action_pressed("move_up")):
		_boost_mode()
	
	if (Input.is_action_just_released("move_up")):
		_normal_mode()
		
	if (Input.is_action_pressed("move_down")):
		_slow_mode() 
		
	if (Input.is_action_just_released("move_down")):
		_normal_mode()
		
		
func _boost_mode():
	scroll_speed = 3 * normal_speed
	get_tree().call_group("planets", "boost_mode")
	get_tree().call_group("rockets", "boost_mode")
	
	obstacles_timer.wait_time = 0.3 * obstacles_timer.wait_time

	
	
func _normal_mode():
	scroll_speed = normal_speed
	get_tree().call_group("planets", "normal_mode")
	get_tree().call_group("rockets", "normal_mode")
	obstacles_timer.wait_time = constant_wait_time
	
	
func _slow_mode():
	scroll_speed = 0.5 * normal_speed
	get_tree().call_group("planets", "slow_mode")
	get_tree().call_group("rockets", "boost_mode")
	obstacles_timer.wait_time = 3.5 * obstacles_timer.wait_time



func _on_Area2D_body_entered(body):
	

	
	score+= 1
	$HUD/score.text = str(score)
	
	if (score > Global.high_score):
		$HUD.update_high_score(score)
		


func _on_obstacles_timer_timeout():
	var decide = randi() % 2
#	spawn_location = get_node("obstacles_spawn/spawn_location")
	spawn_location.offset = randi()
	
	var planets = obstacle_1_scene.instance()
	planets.position = spawn_location.position
	add_child(planets)
	
	var rockets = obstacle_2_scene.instance()
	rockets.position = spawn_location.position * rng.randf_range(-1.0, 1.0)
	add_child(rockets)
	

#
#	if(difficulty_button.pressed):
#
#		var meteorite = obstacle_3_scene.instance()
#		var meteorite_spawn_location = get_node("obstacles_spawn/spawn_location")
#
#		meteorite_spawn_location.offset = randi()
#		meteorite.position = meteorite_spawn_location.position
#
#		var meteorite_end_location = get_node("ending_path_meteorite/end_location")	
#		meteorite_end_location.offset = rand_range(0.0, 200.0)
#		var end_position = meteorite_end_location.position
#		meteorite.end_position = end_position
##		meteorite.look_at(end_position)
#		add_child(meteorite) 

func _on_player_body_entered(body):
	if "planet" in body.get_groups():
		$HUD.health_bar_decrement(20)
#	$HUD/game_over.text = "Game Over" 
#	yield(get_tree().create_timer(1), "timeout")
#	get_tree().change_scene("res://UI.tscn")


