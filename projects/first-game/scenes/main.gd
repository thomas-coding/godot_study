extends Node2D
var collected_count := 0
@onready var score_label: Label = get_node_or_null("ScoreLabel")

var is_paused := false
@onready var pause_label: Label = get_node_or_null("PauseLabel")

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	var player := get_node_or_null("Player")
	if player != null:
		# Main stays always-on for pause hotkeys; gameplay nodes must be pausable.
		player.process_mode = Node.PROCESS_MODE_PAUSABLE
	_refresh_score_label()
	_refresh_pause_label()
	for child in get_children():
		if child.has_signal("collected"):
			child.process_mode = Node.PROCESS_MODE_PAUSABLE
			child.collected.connect(_on_coin_collected)

func _on_coin_collected() -> void:
	collected_count += 1
	_refresh_score_label()
	print("Collected: %d" % collected_count)

func _refresh_score_label() -> void:
	if score_label != null:
		score_label.text = "Collected: %d" % collected_count

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().paused = false
		get_tree().reload_current_scene()
	elif event.is_action_pressed("pause_toggle"):
		is_paused = !is_paused
		get_tree().paused = is_paused
		_refresh_pause_label()

func _refresh_pause_label() -> void:
	if pause_label != null:
		pause_label.visible = is_paused
