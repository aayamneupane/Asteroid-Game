extends Node2D


onready var asteroid = $asteroids
onready var speed: Vector2
onready var normal_speed:Vector2 = Vector2.ZERO
onready var damage
onready var score_value
var rng = RandomNumberGenerator.new()

onready var speed_scale: int = 1
var asteroid_type

func _ready():
	speed = Vector2(0, Global.selected_ship["Speed"] * 1.1)
	normal_speed = speed

	rng.randomize()
	asteroid.scale = Vector2(1, 1) * rng.randf_range(0.5, 0.9)
	
func _process(delta):
	asteroid.position += speed * delta
	
func boost_mode():
	speed = 3 * normal_speed 
	
func normal_mode():
	speed = normal_speed
	
func slow_mode():
	speed = 0.5 * normal_speed

