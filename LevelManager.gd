extends Node2D
class_name LevelManager

var collectable_count

func _ready():
	collectable_count = get_tree().get_nodes_in_group("coins").size()
	print("Collectables found: %s"  % collectable_count)
	SignalBus.connect("player_coin_collected", self, "_on_coin_collected")
	SignalBus.connect("player_died", self, "_on_player_died")

func _on_player_died():
	if (PlayerModel.hearts > 0):
		SignalBus.emit_signal("request_reload_scene")
	else:
		SignalBus.emit_signal("request_change_scene", "res://GameOver.tscn")

func _on_coin_collected(value):
	print("_on_coin_collected")
	collectable_count -= 1;
	if (collectable_count <= 0):
		SignalBus.emit_signal("level_finished")
