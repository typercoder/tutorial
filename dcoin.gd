extends CanvasLayer

func _process(delta):
	$Node2D/coin.text = str(Global.coin)
