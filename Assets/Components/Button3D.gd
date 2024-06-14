## Version: 1.1.1 |
## Button that interact in a 3D environment.
##
class_name Button3D
extends Area3D
##Emitted when you press the button with the RaycastBtn3D
signal button_down
##Emitted when you stop pressing the button with the RaycastBtn3D
signal button_up
##Emmited when RayCastBtn3D collides with the button 3D
signal focus_entered
##Emmited when RayCastBtn3D stops colliding with the button 3D
signal focus_exit

##If true, the button is disabled and no action can be taken
@export var disabled:bool = false

var pointed_by_raycast:bool = false

func _input(event):
	if event is InputEventMouseButton:
		if !pointed_by_raycast || disabled || !event.button_index == MOUSE_BUTTON_LEFT: return
		if event.pressed:
			button_down.emit()
		else:
			button_up.emit()

##change pointed_by_raycast to true when RayCastBtn3D collides with the button 3D
func on_raycast_view():
	pointed_by_raycast = true
	focus_entered.emit()

##change pointed_by_raycast to false when RayCastBtn3D stops colliding with the button 3D
func out_off_raycast_view():
	pointed_by_raycast = false
	focus_exit.emit()
