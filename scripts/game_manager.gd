extends Node
@onready var score: Label = $"../UI/GameUI/Score"

var level = 1
var scores = 0


func _ready() -> void:
	var key = "12345678901234561234567890123456".to_utf8_buffer()
	var file = FileAccess.open_encrypted("user://dumped.txt", FileAccess.READ, key)
	if file:
		print("Now reading file...")
		var content = file.get_as_text()
		print("Content value: ",content)
		level = int(content)
	
	print("File level:", level)


func add_point():
	scores += 1
	score.text = "Coins: "+ str(scores)+"/16"
	
func change_scene_func(scene_path:String)-> void:
	get_tree().change_scene_to_file(scene_path)
	
	
	
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")



func level2(_body: Node2D) -> void:
	if scores == 16:
		if level>1:
			print("moving without increasing level")
		else:
			print("Increasing level to 2")
			var check = readmydata(level)
			if check == true:
				print("Entered without writting...")
			else:
				level += 1
				print("Increased level ....", level)
				writemydata(level)
		call_deferred("change_scene_func","res://scenes/world2.tscn")
	else:
		$"../labels/Label5".text = "Collect all coins to finish."




func level3(_body: Node2D) -> void:
	if scores == 16:
		if level>2:
			print("moving without increasing level")
		else:
			print("Increasing level to 2")
			var check = readmydata(level)
			if check == true:
				print("Entered without writting...")
			else:
				level += 1
				print("Increased level ....", level)
				writemydata(level)
		call_deferred("change_scene_func","res://scenes/world3.tscn")
	else:
		$"../labels/L2LB2".text = "Collect all coins to finish."

		

func level4(_body: Node2D) -> void:
	if scores == 16:
		if level>3:
			print("moving without increasing level")
		else:
			print("Increasing level to 2")
			var check = readmydata(level)
			if check == true:
				print("Entered without writting...")
			else:
				level += 1
				print("Increased level ....", level)
				writemydata(level)
		call_deferred("change_scene_func","res://scenes/world4.tscn")
	else:
		$"../labels/nextlevel".text = "Collect all coins to finish."
		
		
		


func level5(_body: Node2D) -> void:
	if scores == 16:
		if level>4:
			print("moving without increasing level")
		else:
			print("Increasing level to 2")
			var check = readmydata(level)
			if check == true:
				print("Entered without writting...")
			else:
				level += 1
				print("Increased level ....", level)
				writemydata(level)
		call_deferred("change_scene_func","res://scenes/world_5.tscn")
	else:
		$"../labels/Label5".text = "Collect all coins to finish."
		
		
		
	


func _on_area_2d_body_entered(_body: Node2D) -> void:
	if scores == 16:
		if level>5:
			print("moving without increasing level")
		else:
			print("Increasing level to 2")
			var check = readmydata(level)
			if check == true:
				print("Entered without writting...")
			else:
				level += 1
				print("Increased level ....", level)
				writemydata(level)
		call_deferred("change_scene_func","res://scenes/gameEnded.tscn")
	else:
		$"../labels/next".text = "Collect all coins to finish."
		


func helper() -> int:
	var key = "12345678901234561234567890123456".to_utf8_buffer()
	var file = FileAccess.open_encrypted("user://dumped.txt", FileAccess.READ, key)
	if file:
		print("file found in helper")
		var content = file.get_as_text()
		file.close()
		level = int(content)
		print(level)
		file.close()
	else:
		print("file not found!")
	return int(level)
#
#
func readmydata(current_level) -> bool:
	
	var key = "12345678901234561234567890123456".to_utf8_buffer()
	var file = FileAccess.open_encrypted("user://dumped.txt", FileAccess.READ, key)
	if file:
		var content = file.get_as_text()
		
		var read_level = int(content)
		print(read_level, " is level ")
		if read_level < current_level:
			return true
		else :
			file.close()
			return false
		
	else :
		return false
		
func writemydata(_level_data):
	var key ="12345678901234561234567890123456".to_utf8_buffer()
	var file = FileAccess.open_encrypted("user://dumped.txt", FileAccess.WRITE, key)
	
	if file:
		print("we added new data: data is : ", _level_data)
		file.store_string(str(_level_data)) 
		file.close()
	else:
		print("File not found! or other error...")

		
	#
