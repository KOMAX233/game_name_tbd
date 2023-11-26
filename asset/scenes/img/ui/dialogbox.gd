extends CanvasLayer

const AVATAR_MAP = {
	"green": preload("res://asset/scenes/img/ui/alienGreen_badge1.png"),
	"yellow": preload("res://asset/scenes/img/ui/alienYellow_badge1.png"),
}

var dialogs = []
var current = 0
@export var interval = 0.05

@onready var content: Label = $content
@onready var avatar: TextureRect = $content/avatar
@onready var nextindicator: TextureRect = $content/nextindicator
var tween : Tween

func _ready() -> void:
	hide_dialog_box()

func _unhandled_input(event):
	if content.visible and event.is_action_pressed("click"):
		if (tween.is_running()):
			print("not running", content.visible_ratio, content.visible_characters)
			tween.kill()
			content.visible_ratio = 1
			content.visible_characters = -1
			nextindicator.show()
			print("not running", content.visible_ratio, content.visible_characters)
		elif current + 1 < dialogs.size():
			_show_dialog(current + 1)
		else:
			hide_dialog_box()
		get_viewport().set_input_as_handled()
		
func hide_dialog_box():
	content.hide()
	
func show_dialog_box(_dialogs):
	dialogs = _dialogs
	content.show()
	_show_dialog(0)
	
func _show_dialog(index):
	current = index
	var dialog = dialogs[current]
	content.text = "「" + dialog.avatar + "」\n" +dialog.text
	avatar.texture = AVATAR_MAP[dialog.avatar]
	nextindicator.hide()
	tween = create_tween()
	tween.tween_property(content, "visible_characters", content.text.length(), interval * content.text.length()).from(0)
	print(tween.is_running(), " ", content.visible_characters, " ", content.visible_characters_behavior, " ", content.visible_ratio, content.visible)
	tween.connect("finished", on_tween_finished)

func on_tween_finished():
	nextindicator.show()

func _on_content_visibility_changed() -> void:
	pass
#	print(content.visible)
#	print(get_tree().paused)
#	get_tree().paused = content.visible
