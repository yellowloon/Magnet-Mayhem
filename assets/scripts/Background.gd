extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	SignalingSingleton.CobaltUp.connect(changespeed)
	SignalingSingleton.Start.connect(changespeed)
	self.autoplay = ("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func changespeed():
	if SignalingSingleton.motionsickness == true:
		self.speed_scale = 1
		return
	self.speed_scale = 1 + log(SignalingSingleton.Cobalt / 15 + 3)
