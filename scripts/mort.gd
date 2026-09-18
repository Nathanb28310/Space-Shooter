extends Control

@onready var game_over_sound: AudioStreamPlayer = $"Game Over sound"
@onready var fond = $TextureRect

func _ready() -> void:
	if OS.has_feature("web") :
		$VBoxContainer/Quitter.hide()
	update_score()
	game_over_sound.play()
	if Global.choix_skin == "normal" :
		fond.texture = preload("res://assets/fond espace.jpg")
	else :
		fond.texture = preload("res://assets/fond espace (paint).png")
		
func _on_restart_button_down() -> void:
	Global.score = 0 
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _on_quitter_button_down() -> void:
	get_tree().quit() 			

func update_score(): 
	$VBoxContainer2/Score.text = "Votre score est de : " + str(Global.score)

func _on_menu_principal_button_down() -> void:
	Global.score = 0 
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_crédits_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/crédit.tscn")
