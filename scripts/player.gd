extends CharacterBody2D
class_name Player
signal mort

@export var speed_joueur = 350
@export var acceleration = 200

@onready var laser_scene = preload("res://scenes/laser.tscn")
@onready var shooting_point = $ShootingPoint
@onready var screen_size = get_viewport_rect().size
@onready var bruit_de_tir: AudioStreamPlayer = $"Bruit de tir"
@onready var bruit_collision_tir: AudioStreamPlayer2D = $"Bruit collision tir"
@onready var deplacement: AudioStreamPlayer2D = $deplacement

func _ready() -> void:
	$Sprite2D.texture = Global.skin_actuel["vaisseau"]
	if Global.choix_skin == "normal" :
		$Sprite2D.scale = Vector2(1,1)
		$Sprite2D.rotation = deg_to_rad(90)
		bruit_de_tir.stream = preload("res://sons/Lazer bullet fire-edited-2026-02-27T17-46-28.mp3")
		bruit_collision_tir.stream = preload("res://sons/Boom.wav")
		
		
func _physics_process(delta) :
	var direction = Input.get_vector("left","right","up","down")
	velocity.x = move_toward(velocity.x, direction.x * speed_joueur, acceleration)
	velocity.y = move_toward(velocity.y, direction.y * speed_joueur, acceleration)
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if Input.is_action_just_pressed("tir") :
		var laser_instance = laser_scene.instantiate()
		laser_instance.global_position = shooting_point.global_position
		owner.add_child(laser_instance)
		bruit_de_tir.play()
	
	move_and_slide()

func touché():
	mort.emit()

func jouer_son():
	if Global.choix_skin != "normal" :
		bruit_collision_tir.volume_db = 15
	bruit_collision_tir.play()
