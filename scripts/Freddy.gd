extends Node2D

var char_position = "poobert"

@onready var monitor_layer: CanvasLayer = get_node("/root/Office/Monitor")
@onready var office_back_layer: CanvasLayer = get_node("../OfficeBack")
@onready var office_front_layer: CanvasLayer = get_node("../OfficeFront")
@onready var freddy_office: Sprite2D = get_node("/root/Office/OfficeBack/Freddy")
## @onready var office_manager = get_node("/root/Office")

func _ready() -> void:
	print("Freddy AI lvl is ", Global.AI["Freddy"][Global.currentNight - 1])
	freddy_office.visible = false
	$Timer.timeout.connect(timeout)
	$OfficeTimer.timeout.connect(office_timeout)

func reset_to_start():
	char_position = "poobert"
	freddy_office.visible = false

# Movement Opportunity
func timeout() -> void:
	if randi_range(1,20) <= Global.AI["Freddy"][Global.currentNight - 1]:
		# Kill player on next MO if in right hallway
		if char_position == "office" && !office_back_layer.visible:
			print("Freddy attacks.")
			Global.player_dies()
			reset_to_start()
			return
		# Otherwise move normally
		else:
			move()
			print("Freddy moved to: ", char_position)

func office_timeout() -> void:
	# Guaranteed to move when you look at him in office
	if char_position == "office" && office_back_layer.visible:
		move()
		$OfficeTimer.stop()
		print("Freddy immediately moved to: ", char_position)

func on_turn_back() -> void:
	if char_position == "entrance":
		move()
		$OfficeTimer.start()
		print("Forced freddy into office.")

# Movement path
func move() -> void:
	match char_position:
		"poobert":
			char_position = ["edit"].pick_random()
		"edit":
			char_position = ["lounge"].pick_random()
		"lounge":
			char_position = ["entrance"].pick_random()
		"entrance":
			## if office_manager.try_enter(self):
				char_position = ["office"].pick_random()
				freddy_office.visible = true
		"office":
			char_position = ["prop"].pick_random()
			freddy_office.visible = false
			## office_manager.leave(self)
		"prop":
			char_position = ["backstage"].pick_random()
		"backstage":
				char_position = ["edit"].pick_random()
				
