# Rotation Demos
A Godot project containing 3 demos for 2D/3D rotation, including `look_at` and `atan2`.

In the Scenes folder, you will find three scenes of interest:
- `look_at.tscn`
- `demo_2d.tscn`
- `demo_3d.tscn`

Use the (1, 2, 3) keys to move between the different demos (consistent instructions are shown in each scene).

## Maths.gd

Also of interest is the `maths.gd` script which contains two functions:
- `turn_node(looker: Node3D, target: Node3D)`
- `look_at_vertical_lock(looker: Node3D, target: Node3D)`

These achieve similar outcomes but with very different logic. Please refer to the script for more details.

The script also contains a helper function, primarily used in the demos for showcasing properties to the viewer via UI labels:
- `round_to(number: float, place: float)`

## look_at
This demo shows the default behaviour of the `look_at` function when applied to a humanoid object, called `GodotNaut`, which has its transform origin/root node at its feet. The entire object rotates to look at the target (bunny), which looks extremely goofy.

<img width="828" height="590" alt="Screenshot 2026-03-01 213353" src="https://github.com/user-attachments/assets/9cf44bcd-afd3-4d41-9f35-0df8fa432ff5" />

Click on the root node (LookAt) and discover two bools:
- `Lock Y Axis`
- `Rotate Head`

<img width="283" height="175" alt="Screenshot 2026-03-01 213457" src="https://github.com/user-attachments/assets/28b7e0b4-8ab7-498b-9a23-b80db2b05c7c" />

By default, these are both false. If you toggle on `Lock Y Axis`, the GodotNaut will lock its rotation to just the y axis. This results in more natural movement to face the target/bunny. This uses a function in the `maths.gd` script called `look_at_vertical_lock(looker, target)`, which works similarly to `look_at`, but takes in a looker `Node3D` and target `Node3D`. It takes into account their global_positions, and rotates the looker towards the target.

Toggling on `Rotate Head` will allow the head to rotate separately from the body, using the default `look_at` function. This looks relatively natural in the current demo, but has no constraints - if the target/bunny were to move overhead and entirely circle the looker, it would turn its head (eerily, like an owl) and loop entirely around.

## demo_2d 

This demo showcases the use of `atan` (ie. arc tangent, shown left) and `atan2` (ie. arc tangent2, shown right) in object rotation. The use of `atan` results in correct turning between -90 and 90, but not for the rest of our unit circle. 

<img width="1264" height="645" alt="image" src="https://github.com/user-attachments/assets/ed877677-6d1b-44f5-844f-aefc30fdcbae" />

## demo_3d

Similary to the above, this demo showcases the use of `atan` and `atan2` in a 3D space. Again, we see improper turning between -90 and 90. 

<img width="1278" height="539" alt="image" src="https://github.com/user-attachments/assets/8bc2cd25-5d5a-409d-9715-55eefc024e40" />
