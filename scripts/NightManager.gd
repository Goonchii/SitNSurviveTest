extends Node2D

@onready var time = get_node("/root/Office/CanvasLayer/Control/PanelContainer2/HBoxContainer/Time")
var all_active_chars = []
var triggers_done := {}

func reset_all_characters():
	for character in get_tree().get_nodes_in_group("Characters"):
		character.reset_to_start()
	print("All characters have been reset to normal.")

func activate_chars():
	print("Activating characters.")
	all_active_chars.clear()
	# Get the array for the current nights active chars
	var chars_active = Global.night_schedule.get(Global.currentNight, [])
	# Loop thru each character AI node
	for character in get_tree().get_nodes_in_group("Characters"):
		# Get their specific timer
		var timer = character.get_node("Timer")
		# If the name matches a name in the list
		if character.name in chars_active:
			# Start their MO timer and add them to the active list
			timer.start()
			all_active_chars.append(character)
			print(character, " is active.")
		else:
			# If not, stop their timer
			timer.stop()
			print(character, "is disabled.")
