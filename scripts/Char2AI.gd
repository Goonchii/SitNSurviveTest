extends Node2D

var char_position = "stage"

## @onready var office_manager = get_node("/root/Office")

func _ready() -> void:
	print("Char2 AI lvl is ", Global.AI["Char2"][Global.currentNight - 1])
	$Timer.timeout.connect(timeout)

func reset_to_start():
	char_position = "stage"

# Movement Opportunity
func timeout() -> void:
	if randi_range(1,20) <= Global.AI["Char2"][Global.currentNight - 1]:
		# Kill player on next MO if in office
		if char_position == "office":
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
		match char_position:
			"stage":
				char_position = ["dining"].pick_random()
			"dining":
				char_position = ["kitchen"].pick_random()
			"kitchen":
				char_position = ["righthall"].pick_random()
			"righthall":
				## if office_manager.try_enter(self):
					char_position = ["office"].pick_random()
			"office":
				char_position = ["start"].pick_random()
				## office_manager.leave(self)
