extends Area2D

signal hit_player

@export var speed := 260.0
@export var lifetime := 2.0

var direction := Vector2.RIGHT
var _age := 0.0

func setup(spawn_direction: Vector2) -> void:
	if spawn_direction.length() > 0.0:
		direction = spawn_direction.normalized()
	rotation = direction.angle()

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _physics_process(delta: float) -> void:
	global_position += direction * speed * delta
	_age += delta
	if _age >= lifetime:
		queue_free()

func _on_body_entered(body: Node) -> void:
	if body.name != "Player":
		return
	hit_player.emit()
	queue_free()
