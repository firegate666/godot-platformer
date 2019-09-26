extends KinematicBody2D

export var MOVE_SPEED = 200
export var JUMP_SPEED = 1500
export var GRAVITY = 50

var motion = Vector2(0,0)

func _physics_process(delta):
	motion.y += GRAVITY
	
	if (Input.is_action_pressed("ui_right")):
		motion.x = MOVE_SPEED
		$Sprite.flip_h = false
	elif (Input.is_action_pressed("ui_left")):
		motion.x = -MOVE_SPEED
		$Sprite.flip_h = true
	else:
		motion.x = 0
		
	if (is_on_floor()):
		if Input.is_action_just_pressed("ui_up"):
			print("ui up")
			motion.y = -JUMP_SPEED
	
	motion = move_and_slide(motion, Vector2(0, -1))