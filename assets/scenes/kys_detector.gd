extends Area2D


func _on_kys_detector_area_entered(area):
	get_parent().dir = Vector2(-get_parent().dir.x,-get_parent().dir.y)
	get_parent().repulsing = true
	pass # Replace with function body.
