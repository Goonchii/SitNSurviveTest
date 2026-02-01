extends Label

@onready var night_manager = get_node("/root/Office/NightManager")
var nightTime = 12

func _ready() -> void:
	$Timer.timeout.connect(timeout)
	$Timer.start()
	nightTime = 12
	
	night_manager.triggers_done.clear()
	night_manager.reset_all_characters()
	night_manager.activate_chars()
	night_manager.check_hostile_triggers()
	print("Active chars: ", night_manager.all_active_chars)
	print("It is night ", Global.currentNight)

func timeout() -> void:
	nightTime += 1
	if nightTime > 12:
		nightTime = 1
	text = str(nightTime, "AM")
	print("Time is: ", nightTime, "AM")
	night_manager.check_hostile_triggers()
	
	if nightTime == 6:
		get_tree().change_scene_to_file("res://scenes/6AM Win.tscn")
		Global.night_completed()
		night_manager.triggers_done.clear()
