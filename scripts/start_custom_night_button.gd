extends Button

func _on_button_up() -> void:
	Global.apply_custom_night()
	get_tree().change_scene_to_file("res://scenes/office.tscn")
