extends Node

var AI = {
	"Char1": [20,1,1,1,1],
	"Char2": [20,2,3,4,5]
}
var night_schedule = {
	1: ["Char1"],
	2: ["Char2"],
	3: [],
	4: [],
	5: []
}
var hostile_schedule = {
	1: [12,1,2,3,4,5],
	2: [],
	3: [],
	4: [],
	5: []
}
var all_active_chars = []
var completedNights = [false, false, false, false, false]
var currentNight = 1

func _ready() -> void:
	load_data()
	currentNight = get_next_night()
	
func save_data():
	var file = FileAccess.open("user://save_data.dat", FileAccess.WRITE)
	file.store_var(completedNights)
	print("Saved data")

func load_data():
	if FileAccess.file_exists("user://save_data.dat"):
		var file = FileAccess.open("user://save_data.dat", FileAccess.READ)
		completedNights = file.get_var()
		print("Loaded saved data.")
	else: # Blank data
		completedNights = [false, false, false, false, false]
		print("No saved data.")

func delete_save():
	if FileAccess.file_exists("user://save_data.dat"):
		DirAccess.remove_absolute("user://save_data.dat")
		print("Save data deleted.")
	completedNights = [false, false, false, false, false]
	currentNight = 1

func get_next_night() -> int:
	# Iterate thru every night
	for i in completedNights.size():
		# If the val is false (night is not complete)
		if not completedNights[i]:
			# Add 1 to get night num (bc it starts at 0)
			return i + 1
	# If all nights done return early
	return completedNights.size()

func night_completed():
	# Start @ 0 for index
	var index = currentNight - 1
	# If its 0+ and under max amt of nights
	if index >= 0 and index < completedNights.size():
		# Set the corresponding night as complete
		completedNights[index] = true
		# Save and update the current night to the next one
		save_data()
		currentNight = get_next_night()

func activate_chars():
	all_active_chars.clear()
	var chars_active = night_schedule.get(currentNight, [])
	for character in get_tree().get_nodes_in_group("Characters"):
		var timer = character.get_node("Timer")
		if character.name in chars_active:
			character.visible = true
			character.set_process(true)
			timer.start()
			all_active_chars.append(character)
			print(character, " is active.")
		else:
			character.visible = false
			character.set_process(false)
			timer.stop()
			print(character, "is disabled.")

# WIP finish after active chars
func pick_random_hostile():
	print("A character is now hostile.")
