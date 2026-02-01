extends Control

var isDragging = false
var movedToTop = false
var parent
var offset
@onready var button = get_node("/root/Office/CanvasLayer/Control/PanelContainer2/HBoxContainer/Button2")

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		offset = get_local_mouse_position()
		var drag_rect := Rect2(Vector2.ZERO, Vector2(size.x, 24))
		
		if drag_rect.has_point(offset):
			isDragging = true

func _ready():
	var _parent = get_parent()
	if _parent is Control:
		parent = _parent

func _process(_delta):
	if isDragging:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			var pos = get_viewport().get_mouse_position() - offset;

			if (parent != null):
				pos -= parent.global_position

				var _w = parent.size.x - size.x
				var _h = parent.size.y - size.y

				if (pos.x <= 0):
					pos.x = 0
				elif (pos.x > _w):
					pos.x = _w

				if (pos.y <= 0):
					pos.y = 0
				elif (pos.y > _h):
					pos.y = _h
			if !movedToTop && parent != null:
				parent.move_child(self, parent.get_child_count())
				movedToTop = true

			position = pos
		else:
			isDragging = false
			movedToTop = false

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
