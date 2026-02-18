extends CharacterBody2D
@export var speed := 220.0
@export var jump_velocity := -420.0

var gravity := ProjectSettings.get_setting("physics/2d/default_gravity") as float

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	var dir := Input.get_axis("move_left", "move_right")
	velocity.x = dir * speed
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	move_and_slide()
