extends Node2D

var char_position = "stage"
var punishment: float = 0

## @onready var office_manager = get_node("/root/Office")
@onready var shock_button_controls = get_node("../OfficeUI/ShockButtonControls")
@onready var steven_office: Sprite2D = get_node("/root/Office/OfficeUI/Steven")

func _ready() -> void:
	print("Steven AI lvl is ", Global.AI["Steven"][Global.currentNight - 1])
	steven_office.visible = false
	$Timer.timeout.connect(timeout)
	$PunishmentTimer.timeout.connect(punishment_timeout)

func reset_to_start():
	char_position = "stage"

# Movement Opportunity
func timeout() -> void:
	if randi_range(1,20) <= Global.AI["Steven"][Global.currentNight - 1]:
		# Kill player on next MO if in office
		if char_position == "office":
			print("Steven attacks.")
			Global.player_dies()
			reset_to_start()
			return
		# Otherwise move normally
		else:
			move()
			print("Steven moved to: ", char_position)

func punish() -> void:
	if shock_button_controls.shock_counter == 1:
		$Timer.start()
	
	$Timer.wait_time -= punishment
	print("Timer is now ", $Timer.wait_time)

func punishment_timeout() -> void:
	if punishment > 0.2:
		punishment -= 0.2
		print("Punishment is now ", punishment)

# Movement path
func move() -> void:
		match char_position:
			"stage":
				char_position = ["dining"].pick_random()
			"dining":
				char_position = ["backstage"].pick_random()
			"backstage":
				char_position = ["lefthall"].pick_random()
			"lefthall":
				## if office_manager.try_enter(self):
					char_position = ["office"].pick_random()
					steven_office.visible = true
			"office":
				char_position = ["stage"].pick_random()
				steven_office.visible = false
				## office_manager.leave(self)
