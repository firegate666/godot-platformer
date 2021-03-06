extends KinematicBody2D

const MOVE_SPEED = 400
const PRIMARY_JUMP_SPEED = 1500
const SECONDARY_JUMP_SPEED = 750
const GRAVITY = 50
const STOP_ON_SLOPE = true

var motion = Vector2(0,0)
var can_double_jump = false

func _update_animation():
	if (motion.x != 0):
		$Sprite.play("Walk")
	else:
		$Sprite.play("Idle")

	if (!is_on_floor()):
		if (motion.y > 1):
			$Sprite.play("Fall")
		elif (motion.y < 1):
			$Sprite.play("Jump")

func _physics_process(delta):
	motion.y += GRAVITY
	var snap = Vector2(0, 16)
	
	if (Input.is_action_pressed("ui_right")):
		motion.x = MOVE_SPEED
		$Sprite.flip_h = false
	elif (Input.is_action_pressed("ui_left")):
		motion.x = -MOVE_SPEED
		$Sprite.flip_h = true
	else:
		motion.x = 0

	if (is_on_floor()):
		can_double_jump = false
		if Input.is_action_just_pressed("ui_up"):
			snap = Vector2(0, 0)
			motion.y = -PRIMARY_JUMP_SPEED
			can_double_jump = true
	else:
		if (motion.y > 0):
			can_double_jump = false

		if (can_double_jump):
			if Input.is_action_just_pressed("ui_up"):
				snap = Vector2(0, 0)
				motion.y -= SECONDARY_JUMP_SPEED
				can_double_jump = false
	
	motion = move_and_slide_with_snap(motion, snap, Vector2(0, -1), STOP_ON_SLOPE)
	_update_animation()