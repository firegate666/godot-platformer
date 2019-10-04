extends Node
class_name PlayerModel

# total coins for the player
var coins_collected_safe = 0

# current coins from level
var coins_collected_unsafe = 0

var hearts = 3

func _ready():
	SignalBus.connect("player_coin_collected", self, "_on_coin_collected")
	SignalBus.connect("player_heart_collected", self, "_on_heart_collected")
	SignalBus.connect("level_warp", self, "_on_level_warp")
	SignalBus.connect("player_died", self, "_on_player_died")
	
func _on_heart_collected(value):
	hearts += value
	SignalBus.emit_signal("player_model_updated", self)

func _on_coin_collected(value):
	coins_collected_unsafe += value
	SignalBus.emit_signal("player_model_updated", self)

func _on_level_warp():
	coins_collected_safe += coins_collected_unsafe
	coins_collected_unsafe = 0
	SignalBus.emit_signal("player_model_updated", self)

func _on_player_died():
	coins_collected_unsafe = 0
	hearts -= 1
	SignalBus.emit_signal("player_model_updated", self)

func get_coins_total():
	return coins_collected_unsafe + coins_collected_safe
