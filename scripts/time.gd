extends Label

var nightTime = 12
var triggers_done = []

func _ready() -> void:
	$Timer.timeout.connect(timeout)
	$Timer.start()

func start_night():
	nightTime = 12
	triggers_done.clear()
	timeout()
	$Timer.start

func timeout() -> void:
	nightTime += 1
	if nightTime > 12:
		nightTime = 1
	text = str(nightTime, "AM")
	print("Time is: ", nightTime, "AM")
	
	if Global.hostile_schedule.has(Global.currentNight) and nightTime in Global.hostile_schedule[Global.currentNight]:
		if nightTime not in triggers_done:
			Global.pick_random_hostile()
			triggers_done.append(nightTime)
			print("Triggers done: ", triggers_done)
	
	if nightTime == 6:
		get_tree().change_scene_to_file("res://scenes/6AM Win.tscn")
		Global.night_completed()
		triggers_done.clear()
