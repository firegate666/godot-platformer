extends KinematicBody2D

const MOVE_SPEED = 200
const GRAVITY = 50

var motion = Vector2(0,0)

func _physics_process(delta):
	motion.y += GRAVITY
	
	if (Input.is_action_pressed("ui_right")):
		motion.x = MOVE_SPEED
	elif (Input.is_action_pressed("ui_left")):
		motion.x = -MOVE_SPEED
	else:
		motion.x = 0
	
	motion = move_and_slide(motion, Vector2(0, 1))