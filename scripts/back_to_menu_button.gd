extends Button

func _ready() -> void:
	$KilledBy.text = Global.killer + " killed you."

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
