extends Node2D
var previouslocation
var location = 0
var locations = [Vector2(0,64),Vector2(0,-64),Vector2(64,0),Vector2(-64,0)]
var countdown = 0
var targetCountdown
var type
@onready var explosive = preload("res://assets/scenes/Explosives.tscn")
@onready var cobalt = preload("res://assets/scenes/Cobalt.tscn")
#0 is cobalt 1 is explosive
# Called when the node enters the scene tree for the first time.
func _ready():
	targetCountdown = randi_range(150,225)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	countdown +=1
	if countdown == targetCountdown:
		SpawnMagnetable()
		print("WHEREE")
		countdown = 0
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
	print("joghn")
