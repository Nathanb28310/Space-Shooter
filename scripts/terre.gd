extends Area2D
class_name Terre
signal degat

func _ready() -> void:
	$Sprite2D.texture = Global.skin_actuel["planete"]
	if Global.choix_skin == "normal" :
		$Sprite2D.scale = Vector2(0.335,0.342)
		$CollisionShape2D.position = Vector2(0,0)
	
func touché() :
	degat.emit()
		
