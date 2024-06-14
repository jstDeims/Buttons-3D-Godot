class_name Button3DWithSounds
extends Button3D
@export_category("Sounds")
@export var button_down_sound:AudioStream
@export var button_up_sound:AudioStream
@export var focus_entered_sound:AudioStream
@export var focus_exit_sound:AudioStream
@export_category("pitch scale")
@export var pitch_min = 0.6
@export var pitch_max = 1.2
var audio_streamer:VariablePitchAudioStreamPlayer3D

func _ready():
	audio_streamer= VariablePitchAudioStreamPlayer3D.new(pitch_min,pitch_max)
	add_child(audio_streamer)
	button_down.connect(stream_button_down_sound)
	button_up.connect(stream_button_up_sound)
	focus_entered.connect(stream_focus_entered_sound)
	focus_exit.connect(stream_focus_exit_sound)

func stream_button_down_sound():
	if button_down_sound:
		audio_streamer.stream = button_down_sound
		audio_streamer.play_with_variance()

func stream_button_up_sound():
	if button_up_sound:
		audio_streamer.stream = button_up_sound
		audio_streamer.play_with_variance()

func stream_focus_entered_sound():
	if focus_entered_sound:
		audio_streamer.stream = focus_entered_sound
		audio_streamer.play_with_variance()

func stream_focus_exit_sound():
	if focus_exit_sound:
		audio_streamer.stream = focus_exit_sound
		audio_streamer.play_with_variance()
