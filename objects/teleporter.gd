extends Interactable
class_name Teleporter

@export_file("*.tscn") var dest: String

func _interact():
	if not dest.is_empty():
		super._interact()
		SceneChanger.change_scene(dest)
