extends Node3D

@export var use_atan2 : bool = true

@onready var target = $Target/Bunny
@onready var looker = $Looker
@onready var target_label = $Target/Bunny/Label3D
@onready var atan_label = $ArcTangent/Label

var t = 0.0

func _process(delta: float) -> void:
	## Rotate the bunny target
	var distance = 1.8
	t = t + 0.02
	target.position.x = sin(t) * distance
	target.position.z = cos(t) * distance
	
	## Have our Godot sphere face the bunny 
	if use_atan2:
		Maths.turn_node(looker, target)
	else:
		looker.rotation.y = atan(target.position.x / target.position.z)
	
	update_labels()

## Update the labels for viewer's information
func update_labels():
	## Update target position label
	var target_x = Maths.round_to(target.position.x, 1)
	var target_z = Maths.round_to(target.position.z, 1)
	target_label.text = "x: " + str(target_x) + ", z: " + str(target_z)
	
	if use_atan2:
		var radians = Maths.round_to(looker.rotation.y / PI, 1)
		var degrees = floor(rad_to_deg(looker.rotation.y))
		atan_label.text = (
			"atan2(x, z)"
			+ "\n= Radians: " + str(radians) + " * π" 
			+ "\n= Degrees: " + str(degrees)
			)
	else:
		var radians = Maths.round_to(looker.rotation.y / PI, 1)
		var degrees = floor(rad_to_deg(looker.rotation.y))
		atan_label.text = (
			"tan(θ) = O / A"
			+ "\nθ = atan(O / A)"
			+ "\nθ = atan(x / z)"
			+ "\n= Radians: " + str(radians) + " * π" 
			+ "\n= Degrees: " + str(degrees)
			)
