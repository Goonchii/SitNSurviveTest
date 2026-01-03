extends Button

func _on_pressed() -> void:
	print("Current night: ", Global.currentNight)
	print("Completed: ", Global.completedNights)
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
