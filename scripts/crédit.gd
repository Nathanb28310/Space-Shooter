extends Control

@onready var fond = $TextureRect


func _ready() -> void:
	$"Mode paint".text = "Mode " + Global.mode
	if Global.choix_skin == "normal" :
		fond.texture = preload("res://assets/fond espace.jpg")
	else :
		fond.texture = preload("res://assets/fond espace (paint).png")
		
func _on_quitter_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")	
		
func _on_mode_paint_button_down() -> void:
	
	if $"Mode paint".text == "Mode paint" :
		await Global.changer_cosmetique("paint")
		$"Mode paint".text = "Mode normal"
		Global.mode = "normal"
	else : 
		await Global.changer_cosmetique("normal")
		$"Mode paint".text = "Mode paint"
		Global.mode = "paint"
		
	if Global.choix_skin == "normal" :
		fond.texture = preload("res://assets/fond espace.jpg")
	else :
		fond.texture = preload("res://assets/fond espace (paint).png")
