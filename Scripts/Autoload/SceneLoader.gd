extends Node

var current_scene = null
var current_path = null

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	SignalBus.connect("request_reload_scene", self, "reload_scene")
	SignalBus.connect("request_change_scene", self, "goto_scene")

func reload_scene():
	if (current_path == null):
		get_tree().reload_current_scene()
	else:
		goto_scene(current_path)

func goto_scene(packed_scene: PackedScene):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.
	
	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:
	
	call_deferred("_deferred_goto_scene", packed_scene)

func _deferred_goto_scene(packed_scene: PackedScene):
	# It is now safe to remove the current scene
	current_scene.free()
	current_path = null
	
	# Load the new scene.
	var s = ResourceLoader.load(packed_scene.resource_path)
	
	# Instance the new scene.
	current_scene = s.instance()
	current_path = packed_scene
	
	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)
	
	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)