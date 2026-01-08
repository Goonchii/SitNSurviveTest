extends Node2D

var char_position = "start"
var state = "normal"

func _ready() -> void:
	print("Char1 is at the: ", char_position)
	print("Char1 AI lvl is ", Global.AI["Char1"][Global.currentNight - 1])
	$Timer.timeout.connect(timeout)

# Movement Opportunity
func timeout() -> void:
	if randi_range(1,20) <= Global.AI["Char1"][Global.currentNight - 1]:
		# Kill player on next MO if in office
		if char_position == "office":
			print("Char1 attacks.")
			Global.player_dies()
			return
		# Otherwise move normally
		else:
			move()
		print("Char1 moved to: ", char_position)

# Movement path
func move() -> void:
	# When faulty
	if state == "hostile":
		match char_position:
			"start":
				char_position = ["room3"].pick_random()
			"room3":
				char_position = ["room2"].pick_random()
			"room2":
				char_position = ["room1"].pick_random()
			"room1":
				char_position = ["room3", "office"].pick_random()
	# When normal
	else:
		match char_position:
			"start":
				char_position = ["room1"].pick_random()
			"room1":
				char_position = ["room2"].pick_random()
			"room2":
				char_position = ["room3", "office"].pick_random()
			"room3":
				char_position = ["room1"].pick_random()
			"office":
				char_position = ["start"].pick_random()
				
