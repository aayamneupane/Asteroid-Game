extends Node

enum SHIP_TYPE {
	ship_1,
	ship_2,
	ship_3
};

export var ship_classification: = [{
	
	"name": "Small Spaceship",
	"Agility" : 900,
	"Speed" : 500,
	"Defense" : 200,
},

{
	"name" : "Astronaut",
	"Agility" : 600,
	"Speed" : 400,
	"Defense" : 400,
},

{
	"name" : "The Fyling Tank",
	"Agility" : 300,
	"Speed" : 300,
	"Defense" : 1000
}
]

var high_score

var selected_ship = ship_classification[1]

func ready():
	pass
