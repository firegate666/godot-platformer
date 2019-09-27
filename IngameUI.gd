extends Control

func _ready():
	_on_player_model_updated(PlayerModel)
	SignalBus.connect("player_model_updated", self, "_on_player_model_updated")
	
func _on_player_model_updated(player_model):
	$ResourcePanel/HBoxContainer/CoinsValue.text = str(player_model.coins_collected)
