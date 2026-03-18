extends Button

var is_open := true
@onready var monitor_layer: CanvasLayer = get_node("/root/Office/GUI/Monitor")

func _on_mouse_entered() -> void:
	is_open = !is_open
	if is_open:
		monitor_layer.hide()
	else:
		monitor_layer.show()
