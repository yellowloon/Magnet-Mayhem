extends Node

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_SPACE):
		get_tree().reload_current_scene()
