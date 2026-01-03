extends Node2D

var Char2Pos = "start"
var Char2State = "normal"
var faultyProgress = 0

# Runs on start
func _ready() -> void:
	print("Char2 is at the: ", Char2Pos)
	$Timer.timeout.connect(timeout)

# Movement Opportunity
func timeout() -> void:
	if randi_range(1,20) <= Global.AI["Char2"]:
		print("Char2 moved.")
		move()
		breaking()
		print("Char2 is in: ", Char2Pos)
		
		# Stop if in office and is faulty
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
				
func breaking() -> void:
	if Char2State == "faulty" or Char2Pos == "office":
		print("[BREAKING] Skipped | State:", Char2State, " Pos:", Char2Pos)
		return
	
	var chance = Global.AI["Char2"] + faultyProgress
	var roll = randi_range(1,100)

	print("[BREAKING] Roll:", roll, "/", 100,
		  " Chance:", chance,
		  " Progress:", faultyProgress)

	if roll <= chance:
		print(">>> [FAULTY TRIGGERED]")
		Char2State = "faulty"
	else:
		faultyProgress += 1
