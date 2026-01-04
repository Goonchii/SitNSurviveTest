extends Button
 

func _on_pressed() -> void:
	Global.delete_save()
	get_tree().reload_current_scene()
