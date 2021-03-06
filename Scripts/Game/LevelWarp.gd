extends Area2D

export (PackedScene) var next_world: PackedScene

var is_active : bool

func _ready():
	SignalBus.connect("level_finished", self, "_on_level_finished")
	connect("body_entered", self, "_on_body_entered")
	self.hide()
	is_active = false

func _on_body_entered(body):
	if (is_active && body.name == "Player"):
		SignalBus.emit_signal("level_warp")
		SignalBus.emit_signal("request_change_scene", next_world)

func _on_level_finished():
	self.show()
	is_active = true
