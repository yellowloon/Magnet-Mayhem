extends AnimatedSprite2D

var type = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func thingy():
	if type == 0:
		self.autoplay = ("default")
		self.play("default")
	else:
		self.autoplay = ("cobalt")
		self.play("cobalt")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_finished():
	self.queue_free()
	pass # Replace with function body.


func _on_animation_looped():
	self.queue_free()
	pass # Replace with function body.
