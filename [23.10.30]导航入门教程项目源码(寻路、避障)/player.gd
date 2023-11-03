extends CharacterBody2D
class_name Player
@export var speed := 100
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var graphic: Node2D = $Graphic

func _physics_process(delta: float) -> void:
	move()

func move() -> void:
	var direction := Input.get_vector("move_left","move_right", "move_up", "move_down")
	if direction != Vector2.ZERO:
		velocity = direction * speed
		animation_player.play("run")
		move_and_slide()
	else:
		animation_player.play("idle")
		velocity = Vector2.ZERO
	if not is_zero_approx(direction.x):
		graphic.scale.x = 1 if direction.x > 0 else -1
