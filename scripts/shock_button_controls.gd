extends Control

@onready var char1 = get_node("/root/Office/Char1")
@onready var char2 = get_node("/root/Office/Char2")

func _on_l_shock_button_button_up() -> void:
	if char1.char_position == "lefthall":
		char1.reset_to_start()

func _on_r_shock_button_button_up() -> void:
	if char2.char_position == "righthall":
		char2.reset_to_start()
