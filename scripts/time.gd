extends Label

var nightTime = 12

func _ready() -> void:
	$Timer.timeout.connect(timeout)
	$Timer.start()

func timeout() -> void:
	nightTime += 1
	if nightTime > 12:
		nightTime = 1
	text = str(nightTime, "AM")
	print("Time is: ", nightTime, "AM")
	if nightTime == 6:
		get_tree().change_scene_to_file("res://scenes/6AM Win.tscn")
		Global.night_completed()
