tool
extends Area2D

var is_open = false
var hidden_offset: Vector2
var show_offset = Vector2(0,0)
var animation_speed = 0.2

func _process(delta):
	doors(delta)

func doors(delta):
	if (is_open):
		$RightCollider.disabled = true
		$UpperSprite.offset = lerp($UpperSprite.offset, Vector2(0, -128), animation_speed)
		$LowerSprite.offset = lerp($LowerSprite.offset, Vector2(0, 128), animation_speed)

func _on_HiddenWay_body_entered(body):
	if (body.name == "Player"):
		is_open = true
