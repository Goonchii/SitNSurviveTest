extends PanelContainer

var dragging := false

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			dragging = event.pressed
	
	elif event is InputEventMouseMotion and dragging:
		global_position += event.relative

func _on_close_button_button_up() -> void:
	self.visible = false
