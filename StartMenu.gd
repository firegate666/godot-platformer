extends Control

export(String, FILE, "*.tscn") var first_world

func _on_StartButton_pressed():
	SignalBus.emit_signal("request_change_scene", first_world)

func _on_QuitButton_pressed():
	get_tree().quit()
