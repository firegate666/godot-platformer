extends Area2D

func _ready():
	connect("body_entered", self, "_on_body_entered")
	
func _on_body_entered(body):
	print("Body collided")
	if (body.name == "Player"):
		SignalBus.emit_signal("player_died")
