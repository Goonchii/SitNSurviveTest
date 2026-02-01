extends Panel

@onready var log_list := $ScrollContainer/Control/VBoxContainer

@export var max_messages := 20

func add_log(message: String) -> void:
	var label = Label.new()
	label.text = message
	label.autowrap_mode = TextServer.AUTOWRAP_WORD
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	label.add_theme_color_override("font_color", Color.BLACK)
	
	log_list.add_child(label)
	
	if log_list.get_child_count() > max_messages :
		log_list.get_child(0).queue_free()
	
	await get_tree().process_frame
	$ScrollContainer.scroll_vertical = $ScrollContainer.get_v_scroll_bar().max_value
