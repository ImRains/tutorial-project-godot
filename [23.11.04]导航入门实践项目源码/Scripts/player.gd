extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var graphic: Node2D = $Graphic

## 玩家速度
@export var speed := 100
var is_moving := false

func _physics_process(delta: float) -> void:
	move()
	update_animation()

func move() -> void:
	if int(navigation_agent_2d.distance_to_target() > 1):
		var direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()
		velocity = direction * speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO

func update_animation() -> void:
	if velocity != Vector2.ZERO:
		is_moving = true
		animation_tree["parameters/Idle/blend_position"] = velocity.normalized()
		animation_tree["parameters/Move/blend_position"] = velocity.normalized()
	else:
		is_moving = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		navigation_agent_2d.target_position = get_global_mouse_position()
		navigation_agent_2d.target_position = navigation_agent_2d.get_final_position()
		var cursor = load("res://cursor.tscn").instantiate()
		cursor.position = get_global_mouse_position()
		get_tree().current_scene.add_child(cursor)


func _on_check_area_area_entered(area: Area2D) -> void:
	create_tween().tween_property(graphic, "modulate", Color(1,1,1,0.5), 0.2)
	pass # Replace with function body.


func _on_check_area_area_exited(area: Area2D) -> void:
	create_tween().tween_property(graphic, "modulate", Color(1,1,1,1), 0.2)
	pass # Replace with function body.
