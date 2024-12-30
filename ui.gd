extends Node2D

@onready var Batteries = [get_child(0),get_child(1),get_child(2)]
@onready var off =  preload("res://assets/sprites/volumeoff.png")
@export var Audio : AudioStreamPlayer2D
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
	if Input.is_action_just_pressed("Space") and SignalingSingleton.playing == false:
		SignalingSingleton.StartGame()
		$Node2D.visible = false
	if Input.is_action_just_pressed("esc") and SignalingSingleton.playing == true:
		SignalingSingleton.playing = false
		SignalingSingleton.Pause.emit()
		$Node2D.visible = true
	pass
func lowerhealth():
	if SignalingSingleton.Health <3:
		Batteries[SignalingSingleton.Health].frame = 1
	pass
func Upscore():
	$Label.text = str(SignalingSingleton.Cobalt)
	$"Node2D/Current Score".text = str(SignalingSingleton.Cobalt)
	pass
func Start():
	$AnimatedSprite2D. frame = 0
	$AnimatedSprite2D2.frame = 0
	$AnimatedSprite2D3.frame = 0
func Pause():
	$Node2D.visible = true
	$Node2D/HighScore.text = str(SignalingSingleton.HighCobalt)
func _on_button_pressed():
	SignalingSingleton.StartGame()
	$Node2D.visible = false
	FunnySound()
	pass # Replace with function body.



func _on_button_toggled(toggled_on):
	SignalingSingleton.motionsickness = !SignalingSingleton.motionsickness
	if toggled_on == true:
		$Node2D/Button.icon = preload("res://assets/sprites/yessick.png")
		FunnySound()
	else:
		$Node2D/Button.icon = preload("res://assets/sprites/nosick.png")
		FunnySound()
	pass # Replace with function body.


func _on_button_2_toggled(toggled_on):
	if toggled_on == true:
		$Node2D/Button2.icon = off
		SignalingSingleton.Mute.emit()
		SignalingSingleton.Muted = true
		FunnySound()
	else:
		$Node2D/Button2.icon = preload("res://assets/sprites/volumeon.png")
		SignalingSingleton.Unmute.emit()
		SignalingSingleton.Muted = false
		FunnySound()
	pass # Replace with function body.
func FunnySound():
	Audio.stream = preload("res://assets/sfx/Select.wav")
	Audio.play()
