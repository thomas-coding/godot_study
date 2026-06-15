extends CharacterBody2D

@export var balance_config: GameBalanceConfig = preload("res://configs/balance_default.tres")

var speed := 220.0
var jump_velocity := -420.0

var gravity := ProjectSettings.get_setting("physics/2d/default_gravity") as float

func _ready() -> void:
	if balance_config == null:
		return
	speed = balance_config.player_speed
	jump_velocity = balance_config.player_jump_velocity

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	var dir := Input.get_axis("move_left", "move_right")
	velocity.x = dir * speed
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	move_and_slide()
