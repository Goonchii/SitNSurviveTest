extends Node2D

# Runs on start
func _ready() -> void:
	print("Char1 is at the: ", Global.Char1Pos)
	$Timer.timeout.connect(timeout)

# Movement Opportunity
func timeout() -> void:
	if randi_range(1,20) <= Global.AI["Char1"]:
		print("Char1 moved.")
		move()
		print("Char1 is in: ", Global.Char1Pos)
		
		# Stop when they reach the door
		if Global.Char1Pos == "door":
			$Timer.stop()
			print("Char1 is at the door.")

# Movement path
func move() -> void:
		match Global.Char1Pos:
			"start":
				Global.Char1Pos = ["room1", "room2"].pick_random()
			"room1":
				Global.Char1Pos = ["room3", "room4"].pick_random()
			"room2":
				Global.Char1Pos = ["room5", "door"].pick_random()
			"room3":
				Global.Char1Pos = ["room2"].pick_random()
			"room4":
				Global.Char1Pos = ["room2"].pick_random()
			"room5":
				Global.Char1Pos = ["room2"].pick_random()
