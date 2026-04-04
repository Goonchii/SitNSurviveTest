extends Node2D

@onready var view_front = $"../OfficeFront"
@onready var view_back  = $"../OfficeBack"
@onready var cams_button = $"../TopUI/CamButton"
@onready var monitor_layer: CanvasLayer = get_node("/root/Office/Monitor")
var facing_front = true

func _ready() -> void:
	facing_front = true
	view_front.visible = true
	view_back.visible = false
	cams_button.visible = true

func _on_turn_back_button_mouse_entered() -> void:
	# TODO: Animation here >
	
	facing_front = !facing_front
	view_front.visible = facing_front
	view_back.visible  = !facing_front
	cams_button.visible = facing_front


func _on_turn_front_button_mouse_entered() -> void:
	# TODO: Animation here >
	
	facing_front = !facing_front
	view_front.visible = facing_front
	view_back.visible  = !facing_front
	cams_button.visible = facing_front

func _on_cam_button_mouse_entered() -> void:
	if monitor_layer.visible:
		monitor_layer.hide()
		view_front.show()
	else:
		monitor_layer.show()
		view_front.hide()
