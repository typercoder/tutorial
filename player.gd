extends KinematicBody2D

var Floor= Vector2(0,-1)
var motion = Vector2()
var player
var Speed = 200
var gravity = 35
var jump = 750
var fireHit = 5
var movex = false
var movey = false
var slice = false
var attackRange = false
var isDeath = false
var isDirection = false
var left_pressed = false
var rangeAttack = false
var justOnce = false 

var fire_ball = preload("res://bullet.tscn") 
#var death = preload("res://character_death.tscn")

func _ready():
	player = get_node("AnimatedSprite")
	$AnimatedSprite.play("idle")
	set_process_input(true)
	

func _fire_ball_shoot():
	var fireAttack = fire_ball.instance() 
	if sign($firingPosition.position.x) == 1:
		fireAttack._set_dir(1)
	else:
		fireAttack._set_dir(-1)
	get_parent().add_child(fireAttack) 	
	fireAttack.global_position = $firingPosition.global_position

func _physics_process(delta):
	var left = Input.is_action_pressed("left")
	var right = Input.is_action_pressed("right")
	
	if Global.health > 0:	#character turn left
		if left:
			motion.x = -Speed
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = true
			movex= true
			if sign($firingPosition.position.x) == 1:
				$firingPosition.position.x *= -1
			#character turn right
		elif right:
			motion.x = Speed
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = false
			movex = true 
			if sign($firingPosition.position.x) == -1:
				$firingPosition.position.x *= -1
		else:
			motion.x = 0
			movex = false
			$AnimatedSprite.play("idle")
			
		if Input.is_action_just_pressed("jump"):
			if is_on_floor():
				motion.y = -jump
				$AnimatedSprite.play("jump")
			motion.y +=gravity
			
		if not is_on_floor():
			$AnimatedSprite.play("jump")
			motion.y +=gravity

		if Input.is_action_just_pressed("attack"):
				_fire_ball_shoot()
				
		motion.y += gravity	* delta
		move_and_slide(motion,Floor)
	else:
		$AnimatedSprite.play("death")
		isDeath = true


func _on_AnimatedSprite_animation_finished():
	if isDeath == true:
		queue_free()
