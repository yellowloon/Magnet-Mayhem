extends RayCast2D

@export var Charge : int
@export var type = 0
#0 = repulse 1 = attract
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.is_colliding() and get_collider():
		get_collider().MagnetBeam(Charge,type)
	pass
