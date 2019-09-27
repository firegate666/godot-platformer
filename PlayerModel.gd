extends Node
class_name PlayerModel

var coins_collected = 0

func _ready(): 
	SignalBus.connect("player_coin_collected", self, "_on_coin_collected")
	
func _on_coin_collected(value):
	coins_collected += value
	SignalBus.emit_signal("player_model_updated", self)
