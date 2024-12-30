extends Node

var Health = 3
var Cobalt = 0
signal UpdateMagnetables
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func DmgPlayer():
	Health -= 1
	if Health <= 0:
		print("dead")
	pass
