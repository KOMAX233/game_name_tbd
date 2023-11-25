extends CharacterBody2D

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer

const SPEED = 300.0

func _physics_process(delta):

	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		sprite_2d.flip_h = direction.x < 0
		if direction.y == -1:
			animation_player.play("run_back")
		if direction.x != 0:
			animation_player.play("run_h")
		if direction.y == 1:
			animation_player.play("run_h")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		animation_player.play("idle")
	velocity = SPEED * direction
	move_and_slide()
