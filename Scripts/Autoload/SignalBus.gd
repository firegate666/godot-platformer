extends Node

signal player_coin_collected(value)
signal player_heart_collected(value)

signal player_died
signal player_model_updated(player_model)

signal level_finished
signal level_warp

signal request_change_scene(path)
signal request_change_packed_scene(packed_scene)
signal request_reload_scene
