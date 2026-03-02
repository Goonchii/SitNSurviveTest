extends Panel

@onready var Char1 = get_node("/root/Office/Char1")
@onready var Char2 = get_node("/root/Office/Char2")

func _process(_float) -> void:
	update_cams()

func update_cams():
	if Char1.state == "hostile":
		match Char1.char_position:
			"start":
				self.visible = true
