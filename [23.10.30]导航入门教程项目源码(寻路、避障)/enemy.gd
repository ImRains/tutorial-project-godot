extends CharacterBody2D

@export var speed := 50
@export var player_node : Player
@onready var navigation_agent_2d: NavigationAgent2D = $Navigation/NavigationAgent2D

func _physics_process(delta: float) -> void:
	if not navigation_agent_2d.is_navigation_finished():
		var direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()
		navigation_agent_2d.set_velocity(direction * speed)


func _on_timer_timeout() -> void:
	# 每0.1s更新目标导航位置
	navigation_agent_2d.target_position = player_node.position
	pass # Replace with function body.


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
	move_and_slide()
	pass # Replace with function body.
