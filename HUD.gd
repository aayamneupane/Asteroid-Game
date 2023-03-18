extends Control


onready var high_score = $high_score_text/high_score
var saved_high_score = File.new()
onready var health_bar = $life/health_bar
func _ready():
	high_score.text = str(Global.high_score)


func update_high_score(p_score):
	Global.high_score = p_score
	
	saved_high_score.open("user://high_score.save", File.WRITE)
	saved_high_score.store_16(p_score)
	
	saved_high_score.close()
	high_score.text = str(Global.high_score)
	
func health_bar_decrement(pts):
	health_bar.value = health_bar.value - 20
	print(health_bar.value)
