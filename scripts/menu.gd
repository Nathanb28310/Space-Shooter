extends Control

@onready var level = preload("res://scenes/level.tscn")
@onready var menu_touche = preload("res://scenes/menu_des_touches.tscn")
@onready var crédits = preload("res://scenes/crédit.tscn")
@onready var fond = $fond

func _ready() -> void:
	if OS.has_feature("web") :
		$VBoxContainer/Quitter.hide()
	if Global.choix_skin == "normal" :
		fond.texture = preload("res://assets/fond espace.jpg")
		$"version paint".hide()
		$"version normal".show()
	else : 
		fond.texture = preload("res://assets/fond espace (paint).png")
		$"version normal".hide()
		$"version paint".show()
		
	
func _on_jouer_button_down() -> void: 
	get_tree().change_scene_to_packed(level)

func _on_quitter_button_down() -> void:
	get_tree().quit()
	
func _on_touches_button_down() -> void:
	get_tree().change_scene_to_packed(menu_touche)

func _on_crédits_button_down() -> void:
	get_tree().change_scene_to_packed(crédits)
