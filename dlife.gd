extends CanvasLayer

func _process(delta):
	$Node2D/TextureProgress.value = Global.health
