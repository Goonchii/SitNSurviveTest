extends Label

@onready var night_manager = get_node("/root/Office/NightManager")
@onready var shock_button_controls = get_node("/root/Office/OfficeUI/ShockButtonControls")
var nightTime = 12

func _ready() -> void:
	$Timer.timeout.connect(timeout)
	$Timer.start()
	nightTime = 12
	
	night_manager.triggers_done.clear()
	night_manager.reset_all_characters()
	night_manager.activate_chars()
	shock_button_controls.shock_counter = 0
	print("Active chars: ", night_manager.all_active_chars)
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
		night_manager.triggers_done.clear()
