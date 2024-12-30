extends Node2D

@export var Music : AudioStreamPlayer2D
@onready var Song = preload("res://assets/sfx/MainTheme.wav")
@onready var loser = preload("res://assets/sfx/LosingTheme.wav")
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalingSingleton.Pause.connect(yousuckstupid)
	Music.stream = Song
	Music.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func yousuckstupid():
	Music.stream = loser
	Music.play()

func _on_audio_stream_player_2d_finished():
	Music.stream = Song
	Music.play()
	pass # Replace with function body.