extends CanvasLayer

@onready var score_label: Label = get_node_or_null("ScoreLabel")
@onready var hp_label: Label = get_node_or_null("HpLabel")
@onready var start_label: Label = get_node_or_null("StartLabel")
@onready var pause_label: Label = get_node_or_null("PauseLabel")
@onready var game_over_label: Label = get_node_or_null("GameOverLabel")
@onready var win_label: Label = get_node_or_null("WinLabel")
@onready var objective_label: Label = get_node_or_null("ObjectiveLabel")

func set_score(value: int) -> void:
	if score_label != null:
		score_label.text = "Collected: %d" % value

func set_hp(value: int) -> void:
	if hp_label != null:
		hp_label.text = "HP: %d" % value

func set_state_hint(state_name: String) -> void:
	if start_label != null:
		start_label.visible = state_name == "WAIT_START"
	if pause_label != null:
		pause_label.visible = state_name == "PAUSED"
	if game_over_label != null:
		game_over_label.visible = state_name == "GAME_OVER"
	if win_label != null:
		win_label.visible = state_name == "WON"

func set_objective_status(unlocked: bool, collected: int, total: int) -> void:
	if objective_label == null:
		return
	if unlocked:
		objective_label.text = "Goal: UNLOCKED (%d/%d)" % [collected, total]
	else:
		objective_label.text = "Goal: LOCKED (%d/%d)" % [collected, total]
