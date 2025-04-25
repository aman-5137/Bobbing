extends Control


func _ready() -> void:
	var key ="12345678901234561234567890123456".to_utf8_buffer()
	var file = FileAccess.open_encrypted("user://dumped.txt", FileAccess.READ, key)
	
	if file:
		var vals = file.get_as_text()
		if vals == "":
			print("Empty string.")
			var file2 = FileAccess.open_encrypted("user://dumped.txt", FileAccess.WRITE, key)
			if file2:
				file2.store_string(str(1)) 
				file2.close()
		file.close()

		
		
func _on_button_pressed_start() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn") # Replace with function body.


func _on_button_2_pressed_maps() -> void:
	get_tree().change_scene_to_file("res://scenes/maps.tscn")

func _on_button_3_pressed() -> void:
	get_tree().quit() # Replace with function body.
