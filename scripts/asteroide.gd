extends Area2D
class_name Asteroide
@export var speed_asteroide = 10

func _ready() -> void:
	$Sprite2D.texture = Global.skin_actuel["asteroide"]

func _physics_process(_delta) :
	global_position.x -= speed_asteroide
	

func die():
	queue_free()
	
func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body is Player :
		body.touché()
		get_node("/root/Level").play_explosion_sound()
		
func _on_area_entered(area: Area2D) -> void:
	queue_free()
	if area is Terre :
		area.touché()
		get_node("/root/Level").play_explosion_sound()
