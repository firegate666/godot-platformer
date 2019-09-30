tool
extends TileMap

export(bool) var reset_map setget reset_map

func reset_map(value = false):
	if (value && Engine.is_editor_hint()):
		clear()
