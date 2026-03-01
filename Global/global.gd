extends Node

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("1"):
		get_tree().change_scene_to_file("res://Scenes/LookAt/look_at.tscn")
	
	elif Input.is_action_just_pressed("2"):
		get_tree().change_scene_to_file("res://Scenes/2D/demo_2d.tscn")
	
	elif Input.is_action_just_pressed("3"):
		get_tree().change_scene_to_file("res://Scenes/3D/demo_3d.tscn")
	
