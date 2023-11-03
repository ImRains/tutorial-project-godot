extends CharacterBody2D

var speed := 100
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var graphic: Node2D = $Graphic
@onready var animation_tree: AnimationTree = $AnimationTree

var is_running:= false

func _physics_process(delta: float) -> void:
	move()
	#animation_handler()
	#animation_tree_condition_handler()
	animation_tree_expression_handler()

func move() -> void:
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	graphic.scale.x = -1 if direction < 0 else 1
	move_and_slide()

#func animation_handler() -> void:
	#if velocity.x == 0:
		#animation_player.play("idle")
	#else:
		#animation_player.play("run")

#func animation_tree_condition_handler() -> void:
	#if velocity.x == 0:
		#animation_tree["parameters/conditions/is_idling"] = true
		#animation_tree["parameters/conditions/is_running"] = false
	#else:
		#animation_tree["parameters/conditions/is_idling"] = false
		#animation_tree["parameters/conditions/is_running"] = true

func animation_tree_expression_handler() -> void:
	if velocity.x == 0:
		is_running = false
	else:
		is_running = true
