extends Area2D

export var value = 1

func _ready():
	connect("body_entered", self, "_on_body_entered")
	$Sprite.play("Turn")
	
func _on_body_entered(body):
	if (body.name == "Player"):
		SignalBus.emit_signal("player_coin_collected", value)
		self.queue_free()
