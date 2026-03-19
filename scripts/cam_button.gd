extends Button

@onready var monitor_layer: CanvasLayer = get_node("/root/Office/GUI/Monitor")

func _on_mouse_entered() -> void:
	if monitor_layer.visible:
		monitor_layer.hide()
	else:
		monitor_layer.show()
