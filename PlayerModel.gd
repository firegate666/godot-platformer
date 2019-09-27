extends Node
class_name PlayerModel

# total coins for the player
var coins_collected_safe = 0

# current coins from level
var coins_collected_unsafe = 0

func _ready(): 
	SignalBus.connect("player_coin_collected", self, "_on_coin_collected")
	SignalBus.connect("level_warp", self, "_on_level_warp")
	SignalBus.connect("player_died", self, "_on_player_died")
	
func _on_coin_collected(value):
	coins_collected_unsafe += value
	SignalBus.emit_signal("player_model_updated", self)

func _on_level_warp():
	coins_collected_safe += coins_collected_unsafe
	coins_collected_unsafe = 0

func _on_player_died():
	coins_collected_unsafe = 0

func get_coins_total():
	return coins_collected_unsafe + coins_collected_safe
