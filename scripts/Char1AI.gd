extends Node2D

var Char1Pos = "start"
var state = "normal"

func _ready() -> void:
	print("Char1 is at the: ", Char1Pos)
	print("Char1 AI lvl is ", Global.AI["Char1"][Global.currentNight - 1])
	$Timer.timeout.connect(timeout)

# Movement Opportunity
func timeout() -> void:
	if randi_range(1,20) <= Global.AI["Char1"][Global.currentNight - 1]:
		print("Char1 moved.")
		move()
		print("Char1 is in: ", Char1Pos)
		
		# Stop when they reach the door
		if Char1Pos == "door":
			$Timer.stop()
			print("Char1 is at the door.")

# Movement path
func move() -> void:
		match Char1Pos:
			"start":
				Char1Pos = ["room1", "room2"].pick_random()
			"room1":
				Char1Pos = ["room3", "room4"].pick_random()
			"room2":
				Char1Pos = ["room5", "door"].pick_random()
			"room3":
				Char1Pos = ["room2"].pick_random()
			"room4":
				Char1Pos = ["room2"].pick_random()
			"room5":
				Char1Pos = ["room2"].pick_random()
