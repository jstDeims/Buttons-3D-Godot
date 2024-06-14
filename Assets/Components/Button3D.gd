## Version: 1.1 |
## Button that interact in a 3D environment.
##
class_name Button3D
extends Area3D
##Emitted when you press the button with the RaycastBtn3D
signal raycast_button_down
##Emitted when you stop pressing the button with the RaycastBtn3D
signal raycast_button_up

##If true, the button is disabled and no action can be taken
@export var disabled:bool = false

var pointed_by_raycast:bool = false

func _ready():
	randomize()
	

func _input(event):
	if event is InputEventMouseButton:
		if !necessary_parameters(event): return
		if event.pressed:
			raycast_button_down.emit()
			print("button down")
		else:
			raycast_button_up.emit()
			print("button up")

func necessary_parameters(event) -> bool:
	if !pointed_by_raycast || disabled || !event.button_index == MOUSE_BUTTON_LEFT: 
		return false
	else:
		return true

func on_raycast_view():
	pointed_by_raycast = true

func out_off_raycast_view():
	pointed_by_raycast = false
