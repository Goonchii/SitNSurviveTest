extends Node

@export var camera_feed: TextureRect

func _ready() -> void:
	switch_camera(0)

func switch_camera(index: int):
	var paths = [
		"/root/Office/CameraRooms/Main",
		"/root/Office/CameraRooms/Poobert",
		"/root/Office/CameraRooms/Backstage",
		"/root/Office/CameraRooms/Edit",
		"/root/Office/CameraRooms/Lounge",
		"/root/Office/CameraRooms/Toilet",
		"/root/Office/CameraRooms/Entrance",
		"/root/Office/CameraRooms/EquipA",
		"/root/Office/CameraRooms/EquipB",
		"/root/Office/CameraRooms/Workshop",
        "/root/Office/CameraRooms/Props"
	]
	(camera_feed.texture as ViewportTexture).viewport_path = paths[index]

func _on_main_button_up() -> void:
	switch_camera(0)
func _on_poobert_button_up() -> void:
	switch_camera(1)
func _on_backstage_button_up() -> void:
	switch_camera(2)
func _on_edit_button_up() -> void:
	switch_camera(3)
func _on_lounge_button_up() -> void:
	switch_camera(4)
func _on_toilet_button_up() -> void:
	switch_camera(5)
func _on_entrance_button_up() -> void:
	switch_camera(6)
func _on_equip_a_button_up() -> void:
	switch_camera(7)
func _on_equip_b_button_up() -> void:
	switch_camera(8)
func _on_workshop_button_up() -> void:
	switch_camera(9)
func _on_props_button_up() -> void:
	switch_camera(10)
