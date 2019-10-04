tool
extends Node2D

export(bool) var empty_world setget empty_world

func empty_world(value = false):
	if (value && Engine.is_editor_hint()):
		for i in range(0, get_child_count()):
			get_child(i).queue_free()
