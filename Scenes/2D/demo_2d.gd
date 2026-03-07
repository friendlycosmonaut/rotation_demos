extends Node2D

@export var use_atan2: bool = true

@onready var summary = get_parent().get_node("Panel/Summary")
@onready var label = get_node("Label")
@onready var angle = get_node("AngleLine")
@onready var looker = get_node("Looker")
@onready var target = get_node("Target")
@onready var target_label = target.get_node("Label")

func _process(delta: float) -> void:
	var viewport = get_viewport()
	var size = viewport.get_visible_rect().size
	var mouse = viewport.get_mouse_position()
		
	## ArcTangent2
	if use_atan2:
		target.position.x = mouse.x - (size.x/2)
		target.position.y = mouse.y - (size.y/2)
		looker.rotation = atan2(target.position.y, target.position.x)
		label.text = "atan2(y, x)"
	else:
		## ArcTangent
		target.position.x = mouse.x - (size.x/2)
		target.position.y = mouse.y - (size.y/2)
		looker.rotation = atan(target.position.y / target.position.x)
		label.text = "atan(y / x)"
	
	## Update the Circle's angle hand
	angle.rotation = looker.rotation
	
	update_labels()

## Update the labels for viewer's information
func update_labels():
	## Update our labels
	## Again, we flip the y axis for this summary text because of Godot's flipped Y axis
	target_label.text = "x: " + str(target.position.x) + ", y: " + str(- target.position.y)
	
	var radians = Maths.round_to(- looker.rotation / PI, 1)
	var degrees = floor(rad_to_deg(- looker.rotation))
	label.text = label.text + (
		"\n= Radians: " + str(radians) + " * π" 
		+ "\n= Degrees: " + str(degrees)
	)
	
	## SUMMARY TEXT -- note technically this runs twice, but oh well...
	## This describes our trig rules and prints.
	## NOTE: Godot's y axis is flipped (up is negative), so we flip the sign
	## for the viewer's benefit of this summary text.
	summary.text = (
		"tan(θ) = O / A"
		+ "\nθ = atan(O / A)"
		+ "\nθ = atan(y / x)"
		+ "\nθ = atan(" + str(- target.position.y) + " / " + str(target.position.x) + ")"
		+ "\nSign: " + str(sign(- target.position.y / target.position.x))
	)
