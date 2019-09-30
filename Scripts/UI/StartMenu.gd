extends Control

export (PackedScene) var next_world: PackedScene

func _on_StartButton_pressed():
	SignalBus.emit_signal("request_change_scene", next_world)

func _on_QuitButton_pressed():
	get_tree().quit()
