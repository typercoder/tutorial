

extends Area2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hits = 0
var speed = 700
var velocity = Vector2()
var direction = 1
var damage_amount = 5

func _set_dir(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = direction * speed * delta
	translate(velocity)
	velocity = Vector2(1, 0).rotated(rotation)

func _on_bullet_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage_amount)
	queue_free()

func _on_bullet_area_entered(area):
	queue_free()
	print("AREA")
