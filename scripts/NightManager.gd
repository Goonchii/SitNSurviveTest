extends Node2D

@onready var time = get_node("/root/Office/CanvasLayer/Control/PanelContainer2/HBoxContainer/Time")
var all_active_chars = []
var triggers_done := {}

func reset_all_characters():
	for character in get_tree().get_nodes_in_group("Characters"):
		character.state = "normal"
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

func check_hostile_triggers():
	print("Checking hostile triggers.")
	# If no entry exits, return
	if not Global.hostile_schedule.has(Global.currentNight):
		print("Nothing can trigger this night.")
		return
	
	# List of trigger times for tonight, how many times the current time is listed, how many times it has already triggered at this time
	var current_night_triggers = Global.hostile_schedule[Global.currentNight]
	print("Night trigger list: ", current_night_triggers)
	var allowed_triggers = current_night_triggers.count(time.nightTime)
	print("Allowed triggers at this time: ", allowed_triggers)
	var used_triggers = triggers_done.get(time.nightTime, 0)
	print("Already triggered: ", used_triggers)
	
	# Trigger as many times as listed
	while used_triggers < allowed_triggers:
		print("Triggering hostile ", used_triggers + 1, "of ", allowed_triggers)
		pick_random_hostile()
		used_triggers += 1
	
	# Add list of times triggered this night to the record
	triggers_done[time.nightTime] = used_triggers
	print("Triggers done: ", triggers_done)

# Pick a random active, non hostile character to become hostile
func pick_random_hostile():
	# Check for active characters who arent already hostile
	var candidates = []
	for character in all_active_chars:
		if character.state != "hostile": # Change to == normal if they shouldnt become hostile while glitched
			candidates.append(character)
	
	# If there is none, return
	if candidates.size() == 0:
		print("No characters left to make hostile.")
		return
	
	# Out of the candidates, choose a random one to become hostile
	var chosen = candidates[randi() % candidates.size()]
	chosen.state = "hostile"
	print(chosen.name, " is now hostile.")
