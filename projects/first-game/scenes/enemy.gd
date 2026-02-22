extends CharacterBody2D

signal hit_player

@export var patrol_speed := 90.0
@export var left_bound_x := 320.0
@export var right_bound_x := 520.0

var _direction := 1.0

@onready var visual: Node2D = get_node_or_null("Visual")
@onready var hitbox: Area2D = get_node_or_null("Hitbox")

func _ready() -> void:
	if hitbox != null:
		hitbox.body_entered.connect(_on_hitbox_body_entered)
	_update_facing()

func _physics_process(_delta: float) -> void:
	velocity = Vector2(_direction * patrol_speed, 0.0)
	move_and_slide()

	if global_position.x <= left_bound_x:
		global_position.x = left_bound_x
		_direction = 1.0
		_update_facing()
	elif global_position.x >= right_bound_x:
		global_position.x = right_bound_x
		_direction = -1.0
		_update_facing()

func _on_hitbox_body_entered(body: Node) -> void:
	if body.name != "Player":
		return
	hit_player.emit()

func _update_facing() -> void:
	if visual == null:
		return
	visual.scale.x = absf(visual.scale.x) * _direction
