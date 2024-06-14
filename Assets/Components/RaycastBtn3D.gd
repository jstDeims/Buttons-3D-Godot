class_name RayCastBtn3D
extends RayCast3D

var once = true
var button_3D:Button3D

func _ready():
	collide_with_areas = true

func _process(delta):
	if is_colliding():
		var act_collision = get_collider()
		if !once:
			return
		if act_collision is Button3D:
			once = false
			button_3D = act_collision
			act_collision.on_raycast_view()
	else:
		if button_3D != null:
			once = true
			button_3D.out_off_raycast_view()
			button_3D = null
