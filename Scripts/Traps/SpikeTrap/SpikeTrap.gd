extends Node2D
	
func _on_player_trapped():
	SignalBus.emit_signal("player_died")
	
func _on_player_detected():
	$Spikes.show_spikes = true
	
func _on_player_left():
	$Spikes.show_spikes = false
