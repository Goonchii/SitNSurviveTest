extends Button

func _ready() -> void:
	text = "Start Night " + str(Global.currentNight)

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/office.tscn")
