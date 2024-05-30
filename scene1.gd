extends Node2D

func _physics_process(delta):
	if Global.health <= 0:
		$GAMEOVER/Panel.visible = true
