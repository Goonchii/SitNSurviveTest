extends Node2D

func _ready() -> void:
	Global.activate_chars()
	print("Active chars: ", Global.all_active_chars)
	print("It is night ", Global.currentNight)
