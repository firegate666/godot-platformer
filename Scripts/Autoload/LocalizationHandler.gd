extends Node

var start_locale = "en"
var current_locale = null

func set_locale(new_locale):
	current_locale = new_locale
	TranslationServer.set_locale(current_locale)

func _ready(): 
	current_locale = start_locale
	TranslationServer.set_locale(current_locale)

func _input(event):
	if (event.is_action_pressed("lang_switch")):
		if (current_locale == "en"):
			set_locale("de")
		else:
			set_locale("en")
