extends Node2D

var char_position = "main"

## @onready var office_manager = get_node("/root/Office")

func _ready() -> void:
	print("Char1 AI lvl is ", Global.AI["Char1"][Global.currentNight - 1])
	$Timer.timeout.connect(timeout)

func reset_to_start():
	char_position = "main"

# Movement Opportunity
func timeout() -> void:
	if randi_range(1,20) <= Global.AI["Char1"][Global.currentNight - 1]:
		# Kill player on next MO if in office
		if char_position == "office":
			print("Char1 attacks.")
			Global.player_dies()
			reset_to_start()
			return
		# Otherwise move normally
		else:
			move()
			print("Char1 moved to: ", char_position)

# Movement path
func move() -> void:
	match char_position:
		"main":
			char_position = ["poobert"].pick_random()
		"poobert":
			char_position = ["edit"].pick_random()
		"edit":
			char_position = ["lounge"].pick_random()
		"lounge":
			## if office_manager.try_enter(self):
				char_position = ["toilet", "entrance"].pick_random()
		"toilet":
			char_position = ["entrance"].pick_random()
		"entrance":
			char_position = ["office"].pick_random()
		"office":
			char_position = ["stage"].pick_random()
			## office_manager.leave(self)
