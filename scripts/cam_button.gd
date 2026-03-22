extends Button

@onready var monitor_layer: CanvasLayer = get_node("/root/Office/OfficeUI/Monitor")
@onready var freddy = get_node("/root/Office/Freddy")

func _on_mouse_entered() -> void:
	if freddy.char_position == "office" && !monitor_layer.visible:
		print("Char2 attacks.")
		Global.player_dies()
		freddy.reset_to_start()
	else: if monitor_layer.visible:
		monitor_layer.hide()
	else:
		monitor_layer.show()
