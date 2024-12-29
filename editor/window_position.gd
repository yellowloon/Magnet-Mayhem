@tool
extends Node

@export_storage var viewport_position: Vector2
@export_storage var viewport_size: Vector2i

@export var main_screen_position_offset := Vector2(0, 0)
@export var main_screen_size_offset := Vector2i(0, 0)

func _enter_tree() -> void:
	if not Engine.is_editor_hint():
		return

	ProjectSettings.set_setting("display/window/size/borderless", true)
	ProjectSettings.set_setting("display/window/size/always_on_top", true)
	ProjectSettings.save()

func _ready() -> void:
	if Engine.is_editor_hint():
		return

	var window := get_window()
	window.position = viewport_position
	window.size = viewport_size

func _process(_delta: float) -> void:
	if not Engine.is_editor_hint():
		return

	var main_screen := EditorInterface.get_editor_main_screen()
	var window_position := Vector2(get_window().position)
	var scale := EditorInterface.get_editor_scale()
	viewport_position = window_position + main_screen.get_screen_transform().origin + main_screen_position_offset * scale
	viewport_size = Vector2i(main_screen.size) + Vector2i(main_screen_size_offset * scale)
