extends Node2D

@onready var view_front = $"../OfficeFront"
@onready var view_back  = $"../OfficeBack"
@onready var monitor_layer: CanvasLayer = get_node("/root/Office/Monitor")

@onready var freddy = $"../Freddy"

var facing_front = true

func _ready() -> void:
	facing_front = true
	view_front.visible = true
	view_back.visible = false
	# TODO: something is broken in here after adding keybinds to do with opening cams in button office and it teleports to other office when closed

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Akey"):
		# TODO: Animation here >
		facing_front = !facing_front
		view_front.visible = facing_front
		view_back.visible  = !facing_front
	if Input.is_action_just_pressed("Dkey"):
		# TODO: Animation here >
		facing_front = !facing_front
		view_front.visible = facing_front
		view_back.visible  = !facing_front
		
		freddy.on_turn_back()
	if Input.is_action_just_pressed("Skey"):
		if monitor_layer.visible:
			monitor_layer.hide()
			view_back.show()
			freddy.on_turn_back()
		else:
			monitor_layer.show()
			view_back.hide()
