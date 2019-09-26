extends Control

export(String, FILE, "*.tscn") var first_world

func _on_StartButton_pressed():
	get_tree().change_scene(first_world)

func _on_QuitButton_pressed():
	get_tree().quit()
