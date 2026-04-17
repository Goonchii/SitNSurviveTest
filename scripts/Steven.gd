extends Node2D

var char_position = "main"
var progression: int = 0

## @onready var office_manager = get_node("/root/Office")
@onready var shock_button_controls = get_node("../OfficeFront/ShockButtonControls")
@onready var steven_office: Sprite2D = get_node("/root/Office/OfficeBack/Steven")

func _ready() -> void:
	steven_office.visible = false

func reset_to_start():
	char_position = "main"
	steven_office.visible = false
	progression = 30 - Global.current_AI["Steven"][Global.currentNight - 1]

# Movement Opportunity
func progress() -> void:
	progression -= 1
	move()
	print("Steven is in: ", char_position)
	print("Steven's progression is: ", progression)

# Movement path
func move() -> void:
	match progression:
		20:
			char_position = ["equipa"].pick_random()
		12:
			char_position = ["equipb"].pick_random()
		7:
			char_position = ["workshop"].pick_random()
		3:
			char_position = ["props"].pick_random()
		0:
			## if office_manager.try_enter(self):
				char_position = ["office"].pick_random()
				steven_office.visible = true
				print("Steven attacks.")
				Global.player_dies("Steven")
				reset_to_start()
