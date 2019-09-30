extends Button

export (PackedScene) var next_world: PackedScene

func _ready():
	connect("pressed", self, "_on_pressed")

func _on_pressed():
	SignalBus.emit_signal("request_change_scene", next_world)
