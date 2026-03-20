extends Node

var AI = {
	"Char1": [5,1,1,1,1],
	"Char2": [5,2,3,4,5],
	"Freddy": [5,5,5,5,5]
}
var night_schedule = {
	1: ["Char1", "Char2","Freddy"],
	2: ["Char2"],
	3: ["Char1"],
	4: [],
	5: []
}
var completedNights = [false, false, false, false, false]
var currentNight = 1

func _ready() -> void:
	load_data()
	currentNight = get_next_night()
	randomize()
	
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

func player_dies():
	print("Player has died.")
	get_tree().change_scene_to_file("res://scenes/Lose.tscn")
