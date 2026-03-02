extends Node2D

var char_position = "start"
var state = "normal"

@onready var office_manager = get_node("/root/Office")

func _ready() -> void:
	print("Char2 is at the: ", char_position)
	print("Char2 AI lvl is ", Global.AI["Char2"][Global.currentNight - 1])
	$Timer.timeout.connect(timeout)

func reset_to_start():
	char_position = "start"

# Movement Opportunity
func timeout() -> void:
	if randi_range(1,20) <= Global.AI["Char2"][Global.currentNight - 1]:
		# Kill player on next MO if in office
		if char_position == "office" && state == "hostile":
			print("Char2 attacks.")
			Global.player_dies()
			reset_to_start()
			return
		# Otherwise move normally
		else:
			move()
		print("Char2 moved to: ", char_position)

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
				if office_manager.try_enter(self):
					char_position = ["office"].pick_random()
			"office":
				char_position = ["start"].pick_random()
				office_manager.leave(self)
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
				if office_manager.try_enter(self):
					char_position = ["office"].pick_random()
			"office":
				char_position = ["start"].pick_random()
				office_manager.leave(self)
