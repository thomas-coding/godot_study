extends CharacterBody2D

signal hit_player

@export var balance_config: GameBalanceConfig = preload("res://configs/balance_default.tres")
var patrol_speed := 90.0

signal fired_projectile(projectile: Node)

@export var projectile_scene: PackedScene = preload("res://scenes/projectile.tscn")
@export var shoot_cooldown := 1.6
@export var projectile_speed := 260.0
@export var projectile_lifetime := 2.0
@export var projectile_spawn_offset := Vector2(20, -8)
var _shoot_timer := 0.0

@export var left_bound_x := 320.0
@export var right_bound_x := 520.0

var _direction := 1.0

@onready var visual: Node2D = get_node_or_null("Visual")
@onready var hitbox: Area2D = get_node_or_null("Hitbox")

func _ready() -> void:
	if balance_config != null:
		patrol_speed = balance_config.enemy_patrol_speed
		shoot_cooldown = balance_config.enemy_shoot_cooldown
		projectile_speed = balance_config.projectile_speed
		projectile_lifetime = balance_config.projectile_lifetime
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

	_shoot_timer -= _delta
	if _shoot_timer <= 0.0:
		_shoot_timer = shoot_cooldown
		_fire_projectile()

func _on_hitbox_body_entered(body: Node) -> void:
	if body.name != "Player":
		return
	hit_player.emit()

func _update_facing() -> void:
	if visual == null:
		return
	visual.scale.x = absf(visual.scale.x) * _direction

func _fire_projectile() -> void:
	if projectile_scene == null:
		return
	var projectile := projectile_scene.instantiate()
	var spawn_direction := Vector2(_direction, 0.0)
	var spawn_offset := Vector2(projectile_spawn_offset.x * _direction, projectile_spawn_offset.y)
	projectile.global_position = global_position + spawn_offset
	projectile.set("speed", projectile_speed)
	projectile.set("lifetime", projectile_lifetime)
	if projectile.has_method("setup"):
		projectile.call("setup", spawn_direction)
	fired_projectile.emit(projectile)
