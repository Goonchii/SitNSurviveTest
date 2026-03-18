extends Node

@onready var camera_feed: TextureRect = get_node("/root/Office/GUI/Monitor/CamFeed")

@onready var cam_stage: SubViewport = get_node("/root/Office/CameraRooms/Stage")
@onready var cam_dining: SubViewport = get_node("/root/Office/CameraRooms/Dining")
@onready var cam_backstage: SubViewport = get_node("/root/Office/CameraRooms/Backstage")
@onready var cam_kitchen: SubViewport = get_node("/root/Office/CameraRooms/Kitchen")
@onready var cam_lefthall: SubViewport = get_node("/root/Office/CameraRooms/LeftHall")
@onready var cam_righthall: SubViewport = get_node("/root/Office/CameraRooms/RightHall")

func switch_camera(viewport: SubViewport):
	camera_feed.texture = viewport.get_texture()

func _on_stage_button_button_up() -> void:
	switch_camera(cam_stage)

func _on_dining_button_button_up() -> void:
	switch_camera(cam_dining)

func _on_backstage_button_button_up() -> void:
	switch_camera(cam_backstage)

func _on_kitchen_button_button_up() -> void:
	switch_camera(cam_kitchen)
	
func _on_left_hall_button_button_up() -> void:
	switch_camera(cam_lefthall)

func _on_right_hall_button_button_up() -> void:
	switch_camera(cam_righthall)
