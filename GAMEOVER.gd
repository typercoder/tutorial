extends CanvasLayer


func _on_PLAYAGAIN_pressed():
	Global.health = 100
	Global.coin = 0
	get_tree().change_scene("res://scene1.tscn")

func _on_EXIT_pressed():
	get_tree().quit()
