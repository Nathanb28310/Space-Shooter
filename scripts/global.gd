extends Node

var score = 0 
var choix_skin = "normal"
var mode = "paint"

var skin = [{"vaisseau" : preload("res://assets/playerShip2_blue.png"), #normal
"laser" : preload("res://assets/laserBlue01.png"),
"planete" : preload("res://assets/planet03.png"),
"fond" : preload("res://assets/fond espace.jpg"),
"asteroide" : preload("res://assets/meteorBrown_big3.png"),
"explosion" : preload("res://assets/Explosion-Photoroom.png"),
},
{"vaisseau" : preload("res://assets/Vaisseau_version_paint.png"), #paint
"laser" : preload("res://assets/laser_version_paint.png"),
"planete" : preload("res://assets/Terre_version_paint.png"),
"fond" : preload("res://assets/fond espace (paint).png"),
"asteroide" : preload("res://assets/asteroide_version_paint.png"),
"explosion" : preload("res://assets/Explosion_version_paint.png"),
}]

var skin_actuel = {"vaisseau" : preload("res://assets/playerShip2_blue.png"),
"laser" : preload("res://assets/laserBlue01.png"),
"planete" : preload("res://assets/planet03.png"),
"fond" : preload("res://assets/fond espace.jpg"),
"asteroide" : preload("res://assets/meteorBrown_big3.png"),
"explosion" : preload("res://assets/Explosion-Photoroom.png")
}

func changer_cosmetique(choix) :
	choix_skin = choix
	for i in skin_actuel :
		if choix == "normal" :
			skin_actuel[i] = skin[0][i] 
		elif choix == "paint" :
			skin_actuel[i] = skin[1][i] 
