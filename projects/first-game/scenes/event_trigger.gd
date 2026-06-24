extends Area2D

signal triggered(event_id: String, target_action: String)

@export var event_id := ""
@export var target_action := "show_message"
@export var trigger_once := true

var has_triggered := false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if trigger_once and has_triggered:
		return
	if not body.name == "Player":
		return

	has_triggered = true
	triggered.emit(event_id, target_action)
