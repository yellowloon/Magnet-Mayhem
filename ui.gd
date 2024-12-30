extends Node2D

var Batteries = [$AnimatedSprite2D,$AnimatedSprite2D2,$AnimatedSprite2D3]
# Called when the node enters the scene tree for the first time.
func _ready():
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
		print(Batteries[2])
	pass
