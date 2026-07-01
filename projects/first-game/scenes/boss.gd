extends CharacterBody2D

signal defeated(boss_position: Vector2)
signal hit_player

enum BossPhase { PHASE_1, PHASE_2 }

@export var hp_max := 6
@export var phase2_hp_threshold := 3
@export var invulnerable_time := 0.45
@export var phase_1_speed := 35.0
@export var phase_2_speed := 85.0
@export var left_bound_x := 220.0
@export var right_bound_x := 330.0

var hp_current := 0
var phase: BossPhase = BossPhase.PHASE_1
var is_invulnerable := false
var is_defeated := false
var direction := 1.0

@onready var hitbox: Area2D = get_node_or_null("Hitbox")
@onready var visual: Sprite2D = get_node_or_null("Visual")

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_PAUSABLE
	hp_current = hp_max
	if hitbox != null:
		hitbox.body_entered.connect(_on_hitbox_body_entered)
	print("Boss ready. HP: %d" % hp_current)

func _physics_process(_delta: float) -> void:
	if is_defeated:
		return

	var current_speed := phase_1_speed
	if phase == BossPhase.PHASE_2:
		current_speed = phase_2_speed

	velocity = Vector2(direction * current_speed, 0.0)
	move_and_slide()

	if is_on_wall():
		direction *= -1.0
		_update_facing()
		return

	if global_position.x <= left_bound_x:
		global_position.x = left_bound_x
		direction = 1.0
		_update_facing()
	elif global_position.x >= right_bound_x:
		global_position.x = right_bound_x
		direction = -1.0
		_update_facing()

func _on_hitbox_body_entered(body: Node) -> void:
	if is_defeated:
			return
	if body.name != "Player":
			return

	if _is_player_stomp(body):
			if not is_invulnerable:
					_take_damage(1)
			return

	hit_player.emit()

func _is_player_stomp(body: Node) -> bool:
	var player_body := body as CharacterBody2D
	if player_body == null:
			return false

	var is_falling := player_body.velocity.y > 0.0
	var is_above_boss := player_body.global_position.y < global_position.y
	return is_falling and is_above_boss

func _take_damage(amount: int) -> void:
	if is_invulnerable:
		return

	is_invulnerable = true
	hp_current = max(hp_current - amount, 0)
	print("Boss HP: %d / %d" % [hp_current, hp_max])

	_check_phase_change()

	if hp_current <= 0:
		_defeat()
		return

	if visual != null:
		visual.modulate = Color(1, 0.3, 0.3)

	await get_tree().create_timer(invulnerable_time).timeout

	if visual != null:
		visual.modulate = Color.WHITE
	is_invulnerable = false

func _check_phase_change() -> void:
	if phase == BossPhase.PHASE_2:
		return
	if hp_current > phase2_hp_threshold:
		return

	phase = BossPhase.PHASE_2
	print("Boss phase changed: PHASE_2")
	if visual != null:
		visual.scale = Vector2(1.45, 1.45)

func _update_facing() -> void:
	if visual == null:
		return
	visual.scale.x = absf(visual.scale.x) * direction

func _defeat() -> void:
	is_defeated = true
	print("Boss defeated")
	defeated.emit(global_position)
	queue_free()
