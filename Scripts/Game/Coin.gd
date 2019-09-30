extends Area2D

export var value = 1

func _ready():
	connect("body_entered", self, "_on_body_entered")
	$AudioStreamPlayer.connect("finished", self, "_on_sound_finished")
	$Sprite.play("Turn")
	
func _on_sound_finished():
	self.queue_free()

func _on_body_entered(body):
	if (body.name == "Player"):
		$AudioStreamPlayer.play()
		SignalBus.emit_signal("player_coin_collected", value)
		self.hide()

