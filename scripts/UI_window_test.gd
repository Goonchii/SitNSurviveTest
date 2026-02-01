extends Control

@onready var button = get_node("/root/Office/CanvasLayer/Control/PanelContainer2/HBoxContainer/Button2")

func _on_button_2_toggled(toggled_on: bool) -> void:
	self.visible = toggled_on

func _on_close_button_pressed() -> void:
	self.visible = false
	button.button_pressed = false

func _on_minimise_button_pressed() -> void:
	self.visible = false
	button.button_pressed = false

func _on_button_pressed() -> void:
	self.visible = true
	button.button_pressed = true
