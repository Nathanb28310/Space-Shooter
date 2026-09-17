extends Area2D
var speed_laser = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready() -> void:
	$Sprite2D.texture = Global.skin_actuel["laser"]

func _physics_process(_delta) :
	global_position.x += speed_laser

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_area_entered(area) :
	queue_free()
	if area is Asteroide:
		area.die()
		get_node("/root/Level/Player").jouer_son()
		get_node("/root/Level").augmenter_score() 
		
