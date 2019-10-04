extends Area2D

export (NodePath) var teleport_target: NodePath

func _on_Teleport_body_entered(body):
	if (body.name == "Player"):
		body.global_position = get_node(teleport_target).position