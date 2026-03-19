extends Node

@export var camera_feed: TextureRect

func _ready() -> void:
	switch_camera(0)

func switch_camera(index: int):
	var paths = [
		"/root/Office/CameraRooms/Stage",
		"/root/Office/CameraRooms/Dining",
		"/root/Office/CameraRooms/Backstage",
		"/root/Office/CameraRooms/Kitchen",
		"/root/Office/CameraRooms/LeftHall",
        "/root/Office/CameraRooms/RightHall"
	]
	(camera_feed.texture as ViewportTexture).viewport_path = paths[index]

func _on_stage_button_button_up() -> void:
	switch_camera(0)
func _on_dining_button_button_up() -> void:
	switch_camera(1)
func _on_backstage_button_button_up() -> void:
	switch_camera(2)
func _on_kitchen_button_button_up() -> void:
	switch_camera(3)
func _on_left_hall_button_button_up() -> void:
	switch_camera(4)
func _on_right_hall_button_button_up() -> void:
	switch_camera(5)
