extends Label

@onready var shock_button_controls = get_node("/root/Office/OfficeUI/ShockButtonControls")
var nightTime = 12

func _ready() -> void:
	$Timer.timeout.connect(timeout)
	$Timer.start()
	nightTime = 12
	
	reset_all_characters()
	shock_button_controls.shock_counter = 0
	print("It is night ", Global.currentNight)
	print("Shock counter set to: ", shock_button_controls.shock_counter)

func timeout() -> void:
	nightTime += 1
	if nightTime > 12:
		nightTime = 1
	text = str(nightTime, "AM")
	print("Time is: ", nightTime, "AM")
	
	if nightTime == 6:
		get_tree().change_scene_to_file("res://scenes/6AM Win.tscn")
		Global.night_completed()

func reset_all_characters():
	for character in get_tree().get_nodes_in_group("Characters"):
		character.reset_to_start()
	print("All characters have been reset to start.")
