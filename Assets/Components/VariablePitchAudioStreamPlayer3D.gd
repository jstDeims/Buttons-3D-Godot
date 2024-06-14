# Originally taken of https://github.com/uheartbeast/Galaxy-Defiance.git
# Give the component a class name so it can be instanced as a custom node
class_name VariablePitchAudioStreamPlayer3D
extends AudioStreamPlayer3D

# This custom node is used to easily play a sound with a variable pitch

# Export the minimum and maximum pitch amounts
@export var pitch_min = 0.6
@export var pitch_max = 1.2

# Allow the node to automatically play the sound with the pitch variance
@export var auto_play_with_variance: = false

func _init(min_pitch:float = pitch_min, max_pitch:float= pitch_max, auto_play:bool = auto_play_with_variance):
	pitch_min = min_pitch
	max_pitch = max_pitch
	auto_play_with_variance = auto_play

func _ready() -> void:
	if auto_play_with_variance:
		play_with_variance()

# This is the function for playing the sound using a variance in the pitch

func play_with_variance() -> void:
	if !stream: return
	# Set the pitch scale before playing the sound (picking a random amount between the minimum and maximum)
	pitch_scale = randf_range(pitch_min, pitch_max)
	play()
