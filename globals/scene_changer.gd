extends CanvasLayer

@onready var color_rect = $ColorRect

func change_scene(path: String):
	var tween = create_tween()
	var callable = Callable(color_rect, "show")
	tween.tween_callback(callable)
	tween.tween_property(color_rect, "color:a", 1.0, 0.3)
	
	callable = Callable(get_tree(), "change_scene_to_file")
	callable.call(path)
	tween.tween_property(color_rect, "color:a", 0.0, 0.3)
	
	callable = Callable(color_rect, "hide")
	tween.tween_callback(callable)
