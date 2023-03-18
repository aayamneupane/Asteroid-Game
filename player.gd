extends Area2D



var speed = Global.selected_ship["Speed"]
var defense = Global.selected_ship["Defense"]
var agility = Global.selected_ship["Agility"]
var curent_ship
onready var initial_fire_position = $fire_animation.position
onready var screen_size
onready var player_size = $astronaut.get_rect().size


func _ready():
	screen_size = get_viewport().size
	
	if (Global.selected_ship["name"] == Global.ship_classification[0]["name"]):
		
		var current_ship = $small_spaceship
		$astronaut.visible = false
		$rocket.visible = false
		$collison_map_rocket.disabled = true
		$astronaut_collison_map.disabled = true

	elif (Global.selected_ship["name"] == Global.ship_classification[1]["name"]):
		var current_ship = $astronaut
		$small_spaceship.visible = false
		$rocket.visible = false
		$collison_map_rocket.disabled = true
		$collison_map_small_spaceship.disabled = true

	elif (Global.selected_ship["name"] == Global.ship_classification[2]["name"]):
		var current_ship = $rocket
		$small_spaceship.visible = false
		$astronaut.visible = false
		$collison_map_small_spaceship.disabled = true
		$astronaut_collison_map.disabled = true

	
	
	
	
func _process(delta):
		var velocity = Vector2.ZERO
		if Input.is_action_pressed("move_left"):
			velocity.x += -1
		elif Input.is_action_pressed("move_right"):
			velocity.x+= 1
		
		if(velocity.length() > 0):
			velocity = velocity.normalized() * agility
		
		position += velocity * delta
		position.x = clamp(position.x, 0, screen_size.x)

			
		if velocity.x < 0:
			$astronaut.flip_h = true
			if(Global.selected_ship == Global.ship_classification[1]):
				$fire_animation.position.x = $astronaut.position.x - 20
		else:
			$astronaut.flip_h = false
			$fire_animation.position = initial_fire_position
