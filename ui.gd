extends Node2D

@onready var Batteries = [get_child(0),get_child(1),get_child(2)]
@onready var off =  preload("res://assets/sprites/volumeoff.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalingSingleton.Pause.connect(Pause)
	SignalingSingleton.Start.connect(Start)
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
func Start():
	$AnimatedSprite2D. frame = 0
	$AnimatedSprite2D2.frame = 0
	$AnimatedSprite2D3.frame = 0
func Pause():
	$Node2D.visible = true
	$Node2D/Label.text = str(SignalingSingleton.HighCobalt)
func _on_button_pressed():
	SignalingSingleton.StartGame()
	$Node2D.visible = false
	pass # Replace with function body.



func _on_button_toggled(toggled_on):
	SignalingSingleton.motionsickness = !SignalingSingleton.motionsickness
	if toggled_on == true:
		$Node2D/Button.text = "Motion Sickness ON"
	else:
		$Node2D/Button.text = "Motion Sickness OFF"
	pass # Replace with function body.


func _on_button_2_toggled(toggled_on):
	if toggled_on == true:
		$Node2D/Button2.icon = off
		SignalingSingleton.Mute.emit()
		SignalingSingleton.Muted = true
	else:
		$Node2D/Button2.icon = preload("res://assets/sprites/volumeon.png")
		SignalingSingleton.Unmute.emit()
		SignalingSingleton.Muted = false
	pass # Replace with function body.
