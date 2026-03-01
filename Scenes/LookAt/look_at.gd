extends Node3D

@export var lock_y_axis: bool = false
@export var rotate_head: bool = false

@onready var target = $Target/Bunny
@onready var target_label = $Target/Bunny/Label3D
@onready var looker = $Looker/GodotNaut
@onready var head = $Looker/GodotNaut/Head

var t = 0.0

func _process(delta: float) -> void:
	## Rotate the bunny target
	var distance = 1.5
	t = t + 0.02
	target.position.z = sin(t) * distance
	target.position.y = ((cos(t) * distance)) + 1
	
	## Use look_at or look_at_vertical_lock towards our target
	if lock_y_axis:
		Maths.look_at_vertical_lock(looker, target)
	else:
		looker.look_at(target.position)
	
	## Have the head separately rotate to look at the target
	if rotate_head:
		head.look_at(target.position)
