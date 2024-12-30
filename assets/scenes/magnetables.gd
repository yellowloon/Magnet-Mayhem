extends Area2D

@export var Charge : int
@export var PlayerHitAction : onhitplayer
var dir = Vector2(0,0)
var axis
var repulsing = false
var attracting = false
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalingSingleton.UpdateMagnetables.connect(UpdateState)
	if self.position.y == 0:
		axis = "x"
		dir = Vector2(-self.position.x / abs(self.position.x),0)
	else:
		axis = "y"
		dir = Vector2(0,-self.position.y / abs(self.position.y))

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += dir
	pass
func MagnetBeam(MagnetCharge):
	if attracting == true or repulsing == true:
		return
	if MagnetCharge == Charge:
		dir = Vector2(-dir.x,-dir.y)
		repulsing = true
	else:
		dir = Vector2(dir.x * 2, dir.y * 2)
		attracting = true
		pass
	
	pass
func UpdateState():
	attracting = false
	if repulsing == true:
		return
	if self.position.y == 0:
		axis = "x"
		dir = Vector2(-self.position.x / abs(self.position.x),0)
	else:
		axis = "y"
		dir = Vector2(0,-self.position.y / abs(self.position.y))
	pass


func _on_area_entered(area):
	print("john")
	PlayerHitAction.OnHit()
	self.queue_free()
	pass # Replace with function body.
