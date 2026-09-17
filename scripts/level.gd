extends Node2D

@onready var game_over = preload("res://scenes/mort.tscn")
@onready var enemy = preload("res://scenes/asteroide.tscn")
@onready var img_explosion = preload("res://scenes/explosion.tscn")
@onready var explosion: AudioStreamPlayer2D = $Explosion

var y = RandomNumberGenerator.new()
var vie_joueur = 1
var vie_terre = 3
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	if Global.choix_skin == "normal" :
		explosion.stream = preload("res://sons/explosion-of-a-dropped-projectile.mp3")
	update_vie()
	update_score() 
	$CanvasLayer/TextureRect.texture = Global.skin_actuel["fond"]
	
func update_vie() :
	$"CanvasLayer/VBoxContainer/Vie Joueur".text = "Vie du joueur : " + str(vie_joueur)
	$"CanvasLayer/VBoxContainer/Vie Terre".text = "Vie de la Terre : " + str(vie_terre)
	
func update_score(): 
	$CanvasLayer/VBoxContainer/Score.text = "Score : " + str(Global.score)
	
func augmenter_score() :
	Global.score +=1
	update_score()
	
func prendre_degat_joueur() :
	vie_joueur -= 1
	update_vie()
	if vie_joueur <= 0 : 
		$Player.queue_free()
		var boom = img_explosion.instantiate()
		boom.global_position = $Player.global_position
		get_node("/root/Level").add_child(boom) 
		call_deferred("change_level")
	
func prendre_degat_terre() :
	vie_terre -= 1
	update_vie()
	if vie_terre <= 0 : 
		$Terre.queue_free()
		var boom = img_explosion.instantiate()
		boom.global_position = $Terre.global_position
		get_node("/root/Level").add_child(boom) 
		boom.explosion_terre("explosion_terre")
		call_deferred("change_level")

func change_level() :
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(game_over)
	
func _on_timer_timeout() -> void:
	var ene = enemy.instantiate()
	ene.position = Vector2(1920 , y.randf_range(50,1000))
	get_node("Asteroide").add_child(ene)

func play_explosion_sound():
	if Global.choix_skin != "normal" :
		explosion.volume_db = 30
	explosion.play()
