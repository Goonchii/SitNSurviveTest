extends Node2D

var Char2Pos = "start"
var Char2State = "normal"

func _ready() -> void:
	print("Char2 is at the: ", Char2Pos)
	print("Char2 AI lvl is ", Global.AI["Char2"][Global.currentNight - 1])
	$Timer.timeout.connect(timeout)

# Movement Opportunity
func timeout() -> void:
	if randi_range(1,20) <= Global.AI["Char2"][Global.currentNight - 1]:
		print("Char2 moved.")
		move()
		print("Char2 is in: ", Char2Pos)
		
		# WIP - Stop if in office and is faulty - will need to change when attacking implemented
		if Char2Pos == "office" and Char2State == "faulty":
			$Timer.stop()
			print("Char2 is faulty and in the office. Administer controlled shock.")

# Movement path
func move() -> void:
	# When faulty
	if Char2State == "faulty":
		match Char2Pos:
			"start":
				Char2Pos = ["room3"].pick_random()
			"room3":
				Char2Pos = ["room2"].pick_random()
			"room2":
				Char2Pos = ["room1"].pick_random()
			"room1":
				Char2Pos = ["room3", "office"].pick_random()
	# When normal
	else:
		match Char2Pos:
			"start":
				Char2Pos = ["room1"].pick_random()
			"room1":
				Char2Pos = ["room2"].pick_random()
			"room2":
				Char2Pos = ["room3", "office"].pick_random()
			"room3":
				Char2Pos = ["room1"].pick_random()
			"office":
				Char2Pos = ["start"].pick_random()
				
