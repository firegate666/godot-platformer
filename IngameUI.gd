extends Control

var coins = 0

func _ready():
	SignalBus.connect("player_coin_collected", self, "_on_coin_collected")
	
func _on_coin_collected(value):
	coins += value
	$ResourcePanel/HBoxContainer/CoinsValue.text = str(coins)
