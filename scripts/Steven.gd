extends Node2D

var char_position = "main"
var punishment: float = 0

## @onready var office_manager = get_node("/root/Office")
@onready var shock_button_controls = get_node("../OfficeFront/ShockButtonControls")
@onready var steven_office: Sprite2D = get_node("/root/Office/OfficeBack/Steven")

func _ready() -> void:
	steven_office.visible = false
	$Timer.timeout.connect(timeout)
	$PunishmentTimer.timeout.connect(punishment_timeout)

func reset_to_start():
	char_position = "main"
	steven_office.visible = false

# Movement Opportunity
func timeout() -> void:
	if randi_range(1,20) <= Global.current_AI["Steven"][Global.currentNight - 1]:
		# Kill player on next MO if in office
		if char_position == "office":
			print("Steven attacks.")
			Global.player_dies("Steven")
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
		"main":
			char_position = ["equipa"].pick_random()
		"equipa":
			char_position = ["equipb"].pick_random()
		"equipb":
			char_position = ["prop"].pick_random()
		"prop":
			## if office_manager.try_enter(self):
				char_position = ["office"].pick_random()
				steven_office.visible = true
