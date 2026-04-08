extends Button

func _ready() -> void:
	# Iterate thru every night
	for i in Global.completedNights.size():
		# If the val is false (night is not complete)
		if not Global.completedNights[i]:
			# Add 1 to get night num (bc it starts at 0)
			text = "Start Night " + str(i + 1)
			return

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/office.tscn")
