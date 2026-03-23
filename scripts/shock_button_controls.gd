extends Control

var shock_counter: int = 0
var cooldown_ready: bool = true

@onready var char1 = get_node("/root/Office/Char1")
@onready var char2 = get_node("/root/Office/Char2")
@onready var freddy = get_node("/root/Office/Freddy")
@onready var steven = get_node("/root/Office/Steven")

@onready var b_shock_button = get_node("/root/Office/OfficeUI/BShockButton")
@onready var c_shock_button = get_node("/root/Office/OfficeUI/CShockButton")

func _on_b_shock_button_button_up() -> void:
	if freddy.char_position == "office":
		print("Freddy attacks.")
		Global.player_dies()
		freddy.reset_to_start()
		
	else: if cooldown_ready:
		cooldown_ready = false
		b_shock_button.disabled = true
		c_shock_button.disabled = true
		$CooldownTimer.start()
		
		steven.punish()
		
		char1.reset_to_start()
		print("Shocked bonnie.")
		
		shock_counter += 1
		print("Shock counter set to: ", shock_counter)

func _on_c_shock_button_button_up() -> void:
	if freddy.char_position == "office":
		print("Freddy attacks.")
		Global.player_dies()
		freddy.reset_to_start()
		
	else: if cooldown_ready:
		cooldown_ready = false
		b_shock_button.disabled = true
		c_shock_button.disabled = true
		$CooldownTimer.start()
		
		steven.punish()
		
		char2.reset_to_start()
		print("Shocked chica.")
		
		shock_counter += 1
		print("Shock counter set to: ", shock_counter)


func _on_cooldown_timer_timeout() -> void:
	cooldown_ready = true
	b_shock_button.disabled = false
	c_shock_button.disabled = false
	steven.punishment = 2
