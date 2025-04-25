extends Control
var level = preload("res://scripts/game_manager.gd").new()

func _ready() -> void:
	print(level.helper())
	if level.helper() >= 1:
		$Panel/hbox/level1.disabled = false
	if level.helper() >= 2:
		$Panel/hbox/level2.disabled = false
	if level.helper() >= 3:
		$Panel/hbox/level3.disabled = false
	if level.helper() >= 4:
		$Panel/hbox/level4.disabled = false
	if level.helper() >= 5:
		$Panel/hbox/level5.disabled = false

func _on_back_pressed_backtomenu() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_level_1_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_level_2_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/world2.tscn")
		
		

func _on_level_3_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/world3.tscn")


func _on_level_4_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/world4.tscn")
	
	
func _on_level_5_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/world_5.tscn")
