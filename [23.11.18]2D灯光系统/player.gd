extends CharacterBody2D
@onready var graphic: Node2D = $Graphic
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	move(delta)

func move(delta) -> void:
	var direction_x = Input.get_axis("move_left","move_right")
	velocity.x = direction_x * 100
	velocity.y += ProjectSettings.get("physics/2d/default_gravity") * delta
	if not is_zero_approx(direction_x):
		animation_player.play("run")
		graphic.scale.x = 1 if direction_x > 0 else -1
	else:
		animation_player.play("idle")
	move_and_slide()
