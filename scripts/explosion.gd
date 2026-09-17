extends Sprite2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	$".".texture = Global.skin_actuel["explosion"]
	
func explosion_terre(anim) :
	animation_player.play(anim)	
