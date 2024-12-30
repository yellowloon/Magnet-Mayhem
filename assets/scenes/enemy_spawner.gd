extends Node2D
var previouslocation
var location = 0
var locations = [Vector2(0,64),Vector2(0,-64),Vector2(64,0),Vector2(-64,0)]
var countdown = 0
var targetCountdown
var type
var SpawnSpeed = 120
@onready var explosive = preload("res://assets/scenes/Explosives.tscn")
@onready var cobalt = preload("res://assets/scenes/Cobalt.tscn")
#0 is cobalt 1 is explosive
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalingSingleton.CobaltUp.connect(SpeedUp)
	targetCountdown = randi_range(150,225)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	countdown +=1 * delta * SpawnSpeed
	if countdown >= targetCountdown:
		SpawnMagnetable()
		countdown = 0
		targetCountdown = randi_range(150 / (log(SignalingSingleton.Cobalt * 0.5 + 3)),225)
	pass
func SpawnMagnetable():
	#if randi_range(1,5) > 4:
	location = randi_range(0,3)
	if randi_range(1,3) == 3:
		type = explosive.instantiate()
	else:
		type = cobalt.instantiate()
	self.add_child(type)
	type.position = locations[location]
	type.UpdateState
func SpeedUp():
	SpawnSpeed = (120) * log((SignalingSingleton.Cobalt / 5) + 3)
