extends Node2D

@onready var Batteries = [get_child(0),get_child(1),get_child(2)]
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalingSingleton.CobaltUp.connect(Upscore)
	SignalingSingleton.Damaged.connect(lowerhealth)
	$AnimatedSprite2D. frame = 0
	$AnimatedSprite2D2.frame = 0
	$AnimatedSprite2D3.frame = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func lowerhealth():
	if SignalingSingleton.Health <3:
		Batteries[SignalingSingleton.Health].frame = 1
	pass
func Upscore():
	$Label.text = str(SignalingSingleton.Cobalt)
	pass
