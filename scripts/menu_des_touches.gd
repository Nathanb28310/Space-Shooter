extends Control

@onready var fond = $TextureRect

func _ready() -> void:
	if Global.choix_skin == "normal" :
		fond.texture = preload("res://assets/fond espace.jpg")
	else :
		fond.texture = preload("res://assets/fond espace (paint).png")

func _on_retour_menu_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
