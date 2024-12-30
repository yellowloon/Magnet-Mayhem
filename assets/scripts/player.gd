extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if SignalingSingleton.playing == false:
		return
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_just_pressed("Up"):
		SignalingSingleton.UpdateMagnetables.emit()
		self.rotation_degrees = 180
	if Input.is_action_just_pressed("Down"):
		SignalingSingleton.UpdateMagnetables.emit()
		self.rotation_degrees = 0
	if Input.is_action_just_pressed("Left"):
		SignalingSingleton.UpdateMagnetables.emit()
		self.rotation_degrees = 90
	if Input.is_action_just_pressed("Right"):
		SignalingSingleton.UpdateMagnetables.emit()
		self.rotation_degrees = 270
	
