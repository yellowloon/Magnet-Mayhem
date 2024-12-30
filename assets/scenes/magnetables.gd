extends Area2D

@export var Charge : int
@export var PlayerHitAction : onhitplayer
var dir = Vector2(0,0)
var axis
var repulsing = false
var attracting = false
var Speed = 25
# Called when the node enters the scene tree for the first time.
func _ready():
	SpeedUp()
	SignalingSingleton.CobaltUp.connect(SpeedUp)
	Charge = PlayerHitAction.Charge
	$Sprite2D.texture = PlayerHitAction.texture
#
	SignalingSingleton.UpdateMagnetables.connect(UpdateState)
	#if self.position.y == 0:
		#axis = "x"
		#dir = Vector2(-self.position.x / abs(self.position.x),0)
	#else:
		#axis = "y"
		#dir = Vector2(0,-self.position.y / abs(self.position.y))

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += Vector2(dir.x * Speed * delta, dir.y * Speed * delta)
	if dir == Vector2(0,0):
		UpdateState()
	pass
func MagnetBeam(MagnetCharge,type):
	if attracting == true or repulsing == true:
		return
	if MagnetCharge == Charge:
		if type == 0:
			dir = Vector2(-dir.x,-dir.y)
			repulsing = true
	else:
		if type == 1:
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
func SpeedUp():
	Speed = (12.5 + SignalingSingleton.Cobalt) * 2
