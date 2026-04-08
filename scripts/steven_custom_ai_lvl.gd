extends Label

func _ready() -> void:
	$IncreaseTimer.timeout.connect(increase_timeout)
	$DecreaseTimer.timeout.connect(decrease_timeout)
	text = str(Global.custom_night_AI["Steven"])


func _on_increase_button_down() -> void:
	$IncreaseTimer.start()

func _on_increase_button_up() -> void:
	$IncreaseTimer.stop()

func _on_increase_pressed() -> void:
	if Global.custom_night_AI["Steven"] < 20:
		Global.custom_night_AI["Steven"] += 1
		text = str(Global.custom_night_AI["Steven"])

func increase_timeout() -> void:
	if Global.custom_night_AI["Steven"] < 20:
		Global.custom_night_AI["Steven"] += 1
		text = str(Global.custom_night_AI["Steven"])


func _on_decrease_button_down() -> void:
	$DecreaseTimer.start()

func _on_decrease_button_up() -> void:
	$DecreaseTimer.stop()

func _on_decrease_pressed() -> void:
	if Global.custom_night_AI["Steven"] > 0:
		Global.custom_night_AI["Steven"] -= 1
		text = str(Global.custom_night_AI["Steven"])

func decrease_timeout() -> void:
	if Global.custom_night_AI["Steven"] > 0:
		Global.custom_night_AI["Steven"] -= 1
		text = str(Global.custom_night_AI["Steven"])
