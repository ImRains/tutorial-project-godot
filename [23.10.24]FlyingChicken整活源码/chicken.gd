extends CharacterBody2D
@onready var end_state: Control = $"../CanvasLayer/EndState"
@onready var death: AudioStreamPlayer2D = $Death
@onready var death_sound: AudioStreamPlayer = $DeathSound
@onready var jump_sound: AudioStreamPlayer = $JumpSound
@onready var bgm: AudioStreamPlayer = $"../BGM"


var gravity = 1000
var move_speed = 100
var jump_force = 500
var is_death = false

func _process(delta: float) -> void:
	pass

func _physics_process(delta):
	if not is_death:
		# 应用重力
		velocity.y += gravity * delta
		# 向右移动
		velocity.x = move_speed
		# 更新位置
		move_and_slide()
		if is_on_floor() or is_on_wall() or (position.y < 0 or position.y > 648):
			is_death = true
			death_sound.play()
			bgm.stop()
	else:
		end_state.visible = true

func _input(event):
	if event.is_action_pressed("jump"):
		# 给角色一个向上的力
		velocity.y = -jump_force
		jump_sound.play()
