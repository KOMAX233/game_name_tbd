extends Area2D

@onready var talk_bubble: Sprite2D = $talk_bubble

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if talk_bubble.visible and event.is_action_pressed("interact"):
		Dialogbox.show_dialog_box([
			{avatar="yellow", text="bamba bamba?"},
			{avatar="green", text="bambaaa!"},
			{avatar="yellow", text="hard hard hard hard hard hard hard hard hard hard hard hard hard hard hard hard "},
			{avatar="green", text="loud loud loud loud loud loud loud loud loud loud loud loud loud loud loud loud loud loud loud  loud loud loud loud loud "},
			{avatar="yellow", text="school canteen school canteen school canteen school canteen school canteen school canteen school canteen school canteen school canteen school canteen school canteen school canteen school canteen school canteen school canteen school canteen school canteen school canteen "},
			{avatar="green", text="bellybutton bellybutton bellybutton bellybutton bellybutton bellybutton bye"},
		])

func _on_interactable_area_entered(area: Area2D) -> void:
	talk_bubble.show()


func _on_interactable_area_exited(area: Area2D) -> void:
	talk_bubble.show()
