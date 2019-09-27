extends Control

func _ready():
	_on_player_model_updated(PlayerModel)
	SignalBus.connect("player_model_updated", self, "_on_player_model_updated")
	
func _on_player_model_updated(player_model):
	var coins = player_model.get_coins_total()
	$ResourcePanel/HBoxContainer/CoinsValue.text = str(coins)
	var hearts = player_model.hearts
	$ResourcePanel/HBoxContainer/HeartsValue.text = str(hearts)
