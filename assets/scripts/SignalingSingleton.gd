extends Node

var Health = 3
var Cobalt = 0
signal UpdateMagnetables
signal Damaged
signal CobaltUp
signal Start
signal Pause
signal Mute
signal Unmute
var Muted = false
var HighCobalt = 0
var playing = false
var motionsickness = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func DmgPlayer():
	Health -= 1
	Damaged.emit()
	if Health <= 0:
		print("dead")
		playing = false
		Pause.emit()
	pass
func ScoreIncrease():
	Cobalt += 1
	CobaltUp.emit()
	if Cobalt > HighCobalt:
		HighCobalt = Cobalt
	pass
func StartGame():
	playing = true
	Cobalt = 0
	Health = 3
	Start.emit()
