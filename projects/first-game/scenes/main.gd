extends Node2D
var collected_count := 0
@onready var score_label: Label = get_node_or_null("ScoreLabel")

var is_paused := false
@onready var pause_label: Label = get_node_or_null("PauseLabel")

var is_game_started := false
@onready var start_label: Label = get_node_or_null("StartLabel")

var is_game_over := false
var hp := 3
@onready var hp_label: Label = get_node_or_null("HpLabel")
@onready var game_over_label: Label = get_node_or_null("GameOverLabel")

var is_won := false
@onready var win_label: Label = get_node_or_null("WinLabel")

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	var player := get_node_or_null("Player")
	if player != null:
		# Main stays always-on for pause hotkeys; gameplay nodes must be pausable.
		player.process_mode = Node.PROCESS_MODE_PAUSABLE
	_refresh_score_label()
	_refresh_pause_label()
	_refresh_start_label()
	_refresh_hp_label()
	_refresh_game_over_label()
	_refresh_win_label()
	for child in get_children():
		if child.has_signal("collected"):
			child.process_mode = Node.PROCESS_MODE_PAUSABLE
			child.collected.connect(_on_coin_collected)
		if child.has_signal("hit"):
			child.process_mode = Node.PROCESS_MODE_PAUSABLE
			child.hit.connect(_on_hazard_hit)
		if child.has_signal("reached_goal"):
			child.process_mode = Node.PROCESS_MODE_PAUSABLE
			child.reached_goal.connect(_on_goal_reached)
	# Start gate: game starts after Enter.
	get_tree().paused = true

func _on_coin_collected() -> void:
	if is_game_over or is_won:
		return
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
		return
	if not is_game_started:
		if event.is_action_pressed("start_game"):
			is_game_started = true
			is_paused = false
			get_tree().paused = false
			_refresh_start_label()
			_refresh_pause_label()
		return

	if is_game_over or is_won:
		return

	if event.is_action_pressed("pause_toggle"):
		is_paused = !is_paused
		get_tree().paused = is_paused
		_refresh_pause_label()

func _refresh_pause_label() -> void:
	if pause_label != null:
		pause_label.visible = is_paused


func _refresh_start_label() -> void:
	if start_label != null:
		start_label.visible = not is_game_started

func _on_hazard_hit() -> void:
	if is_game_over or is_won:
		return
	hp -= 1
	_refresh_hp_label()
	print("HP: %d" % hp)
	if hp <= 0:
		is_game_over = true
		is_paused = false
		get_tree().paused = true
		_refresh_pause_label()
		_refresh_game_over_label()

func _refresh_hp_label() -> void:
	if hp_label != null:
		hp_label.text = "HP: %d" % hp

func _refresh_game_over_label() -> void:
	if game_over_label != null:
		game_over_label.visible = is_game_over

func _on_goal_reached() -> void:
	if is_game_over or is_won:
		return
	is_won = true
	is_paused = false
	get_tree().paused = true
	_refresh_pause_label()
	_refresh_win_label()
	print("YOU WIN")

func _refresh_win_label() -> void:
	if win_label != null:
		win_label.visible = is_won
