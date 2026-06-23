extends Node2D

@export var debug_logs := false

var collected_count := 0
var hp := 3
@export var balance_config: GameBalanceConfig = preload("res://configs/balance_default.tres")
@export_file("*.tscn") var next_level_scene_path := ""

var total_coins := 0
var remaining_coins := 0
var goal_unlocked := false


@onready var hud: Node = get_node_or_null("HUD")

enum GameState { WAIT_START, PLAYING, PAUSED, GAME_OVER, WON }
var game_state: GameState = GameState.WAIT_START

@export var unlock_level_on_win := 1

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	if balance_config != null:
		hp = balance_config.player_hp
	var player := get_node_or_null("Player")
	if player != null:
		# Main stays always-on for pause hotkeys; gameplay nodes must be pausable.
		player.process_mode = Node.PROCESS_MODE_PAUSABLE
	_refresh_score_label()
	_refresh_hp_label()
	if SaveManager != null:
		_debug_log("Save snapshot: best=%d unlocked=%d volume=%.2f" % [
			SaveManager.best_score,
			SaveManager.unlocked_level,
			SaveManager.audio_volume
		])
	total_coins = 0
	for child in get_children():
		if child.has_signal("collected"):
			child.process_mode = Node.PROCESS_MODE_PAUSABLE
			child.collected.connect(_on_coin_collected)
			total_coins += 1
		if child.has_signal("hit"):
			child.process_mode = Node.PROCESS_MODE_PAUSABLE
			child.hit.connect(_on_hazard_hit)
		if child.has_signal("hit_player"):
			child.process_mode = Node.PROCESS_MODE_PAUSABLE
			child.hit_player.connect(_on_enemy_hit_player)
		if child.has_signal("reached_goal"):
			child.process_mode = Node.PROCESS_MODE_PAUSABLE
			child.reached_goal.connect(_on_goal_reached)
	remaining_coins = total_coins
	goal_unlocked = remaining_coins == 0
	_debug_log("Coins total: %d" % total_coins)
	# Start gate via state machine.
	_set_game_state(GameState.WAIT_START)
	_refresh_objective_status()

func _on_coin_collected() -> void:
	if game_state != GameState.PLAYING:
		return
	collected_count += 1
	if SaveManager != null:
		SaveManager.try_update_best_score(collected_count)
	remaining_coins = max(remaining_coins - 1, 0)
	_refresh_score_label()
	_debug_log("Collected: %d / %d" % [collected_count, total_coins])
	var required_coins := total_coins
	if balance_config != null:
		required_coins = min(balance_config.required_coins, total_coins)

	if not goal_unlocked and collected_count >= required_coins:
		goal_unlocked = true
		_debug_log("Goal unlocked")
	_refresh_objective_status()

func _refresh_score_label() -> void:
	if hud != null and hud.has_method("set_score"):
		hud.call("set_score", collected_count)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().paused = false
		get_tree().reload_current_scene()
		return
	match game_state:
		GameState.WAIT_START:
			if event.is_action_pressed("start_game"):
				_set_game_state(GameState.PLAYING)
		GameState.PLAYING:
			if event.is_action_pressed("pause_toggle"):
				_set_game_state(GameState.PAUSED)
		GameState.PAUSED:
			if event.is_action_pressed("pause_toggle"):
				_set_game_state(GameState.PLAYING)
		GameState.GAME_OVER, GameState.WON:
			pass

func _refresh_state_hint() -> void:
	if hud != null and hud.has_method("set_state_hint"):
		hud.call("set_state_hint", GameState.keys()[game_state])

func _on_hazard_hit() -> void:
	if game_state != GameState.PLAYING:
		return
	var damage := 1
	if balance_config != null:
		damage = max(balance_config.enemy_damage, 1)
	hp -= damage
	_refresh_hp_label()
	_debug_log("HP: %d" % hp)
	if hp <= 0:
		_set_game_state(GameState.GAME_OVER)

func _on_enemy_hit_player() -> void:
	_on_hazard_hit()

func _refresh_hp_label() -> void:
	if hud != null and hud.has_method("set_hp"):
		hud.call("set_hp", hp)

func _on_goal_reached() -> void:
	if game_state != GameState.PLAYING:
		return
	if not goal_unlocked:
		_debug_log("Goal is locked. Collect all coins first.")
		return
	_set_game_state(GameState.WON)
	if SaveManager != null:
		SaveManager.unlock_level(unlock_level_on_win)
	_debug_log("YOU WIN")
	if not next_level_scene_path.is_empty():
		call_deferred("_go_to_next_level")

func _go_to_next_level() -> void:
	get_tree().paused = false
	var err := get_tree().change_scene_to_file(next_level_scene_path)
	if err != OK:
		push_warning("Level switch failed. err=%d path=%s" % [err, next_level_scene_path])

func _set_game_state(next_state: GameState) -> void:
	game_state = next_state
	_debug_log("State -> %s" % GameState.keys()[game_state])
	match game_state:
		GameState.WAIT_START:
			get_tree().paused = true
		GameState.PLAYING:
			get_tree().paused = false
		GameState.PAUSED:
			get_tree().paused = true
		GameState.GAME_OVER:
			get_tree().paused = true
		GameState.WON:
			get_tree().paused = true

	_refresh_state_hint()

func _refresh_objective_status() -> void:
	if hud != null and hud.has_method("set_objective_status"):
		var required_coins := total_coins
		if balance_config != null:
			required_coins = min(balance_config.required_coins, total_coins)
		hud.call("set_objective_status", goal_unlocked, collected_count, required_coins)

func _debug_log(message: String) -> void:
	if debug_logs:
		print(message)
