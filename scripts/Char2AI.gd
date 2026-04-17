extends Node2D

var char_position = "main"

## @onready var office_manager = get_node("/root/Office")
@onready var char2_office: Sprite2D = get_node("/root/Office/OfficeBack/Char2")

func _ready() -> void:
	$Timer.timeout.connect(timeout)

func reset_to_start():
	char_position = "main"
	char2_office.visible = false

# Movement Opportunity
func timeout() -> void:
	if randi_range(1,20) <= Global.current_AI["Char2"][Global.currentNight - 1]:
		# Kill player on next MO if in office
		if char_position == "office":
			print("Char2 attacks.")
			Global.player_dies("Char2")
			reset_to_start()
			return
		# Otherwise move normally
		else:
			move()
			print("Char2 moved to: ", char_position)

# Movement path
func move() -> void:
	match char_position:
		"main":
			char_position = ["backstage"].pick_random()
		"backstage":
			char_position = ["equipa"].pick_random()
		"equipa":
			char_position = ["equipb"].pick_random()
		"equipb":
			## if office_manager.try_enter(self):
				char_position = ["workshop", "prop"].pick_random()
		"workshop":
			char_position = ["prop"].pick_random()
		"prop":
			char_position = ["office"].pick_random()
			char2_office.visible = true
		"office":
			char2_office.visible = false
			## office_manager.leave(self)
