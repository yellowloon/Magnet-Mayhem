extends Node

var Health = 3
signal UpdateMagnetables
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func DmgPlayer():
	Health -= 1
	pass