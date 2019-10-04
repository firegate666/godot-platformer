extends Sprite

export (PackedScene) var player: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node(".").add_child(instantiate_player())
	pass # Replace with function body.

func instantiate_player():
	var i: KinematicBody2D = load(player.resource_path).instance()
	i.position = Vector2(0, 0)
	return i
