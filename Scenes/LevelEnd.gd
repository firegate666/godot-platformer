extends Node

export (PackedScene) var game_over_scene: PackedScene

func _on_player_died():
	SignalBus.emit_signal("request_change_scene", game_over_scene)
