extends Area2D
var life = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_life_body_entered(body):
	Global.health += 25
	Global.coin += 1
	queue_free()
	print(str(Global.health))
