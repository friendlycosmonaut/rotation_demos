class_name Maths

## NOTE: 'Math' is already a built-in class... So let's use the correct spelling ;)

## Uses atan2 and rotates the looker's y rotation to face the target
## Will accomplish a similar outcome as look_at_vertical_lock
static func turn_node(looker: Node3D, target: Node3D):
	var x_target = target.global_position.x - looker.global_position.x
	var z_target = target.global_position.z - looker.global_position.z
	looker.global_rotation.y = atan2(x_target, z_target)

## Runs look_at on the given 'looker' Node3D towards the target
## Uses the looker and target's global positions
## Looker will face the difference between these global positions
static func look_at_vertical_lock(looker: Node3D, target: Node3D):
	var looker_vector = Vector3(looker.global_position.x, 0, looker.global_position.z)
	var target_vector = Vector3(target.global_position.x, 0, target.global_position.z)
	var difference = target_vector - looker_vector
	looker.look_at(difference)

## Rounds a number to a given decimal place
static func round_to(number: float, place: float) -> float:
	return round(number * pow(10.0, place)) / pow(10.0, place)
