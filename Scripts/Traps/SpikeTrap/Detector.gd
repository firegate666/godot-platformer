extends Area2D

func _on_Detector_body_entered(body):
	if (body.name == "Player"):
		get_parent()._on_player_detected()

func _on_Detector_body_exited(body):
	if (body.name == "Player"):
		get_parent()._on_player_left()
