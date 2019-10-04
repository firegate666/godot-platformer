extends Area2D
class_name Spikes

var show_spikes = false
var hidden_offset: Vector2
var show_offset = Vector2(0,0)
var animation_speed = 0.5

func _ready():
	$Sprite.offset = Vector2(0, 128)
	hidden_offset = $Sprite.offset

func _on_SpikeTrap_body_entered(body):
	if (body.name == "Player"):
		get_parent()._on_player_trapped()

func _process(delta):
		spikes(delta)

func spikes(delta):
	if (show_spikes):
		$Sprite.offset = lerp($Sprite.offset, show_offset, animation_speed)
	else:
		$Sprite.offset = lerp($Sprite.offset, hidden_offset, animation_speed)
