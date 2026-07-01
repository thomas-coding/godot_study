extends Node2D

@export var debug_logs := false

var collected_count := 0
var hp := 3
@export var balance_config: GameBalanceConfig = preload("res://configs/balance_default.tres")
@export_file("*.tscn") var next_level_scene_path := ""

var total_coins := 0
var remaining_coins := 0
var goal_unlocked := false

var triggered_event_ids := {}
@export var wave_enemy_scene: PackedScene = preload("res://scenes/enemy.tscn")

var wave_started := {}
var wave_cleared := {}

var boss_defeated := false
var boss_reward_count := 0
var boss_reward_granted := false
@export var boss_reward_amount := 5

var wave_configs := {
	"wave_01": {
		"enemy_scene": wave_enemy_scene,
		"spawn_points": [
			Vector2(360, 129),
			Vector2(480, 129)
		],
		"unlock_target": "WaveGate"
	}
}

@onready var hud: Node = get_node_or_null("HUD")
@onready var player: Node = get_node_or_null("Player")

enum GameState { WAIT_START, PLAYING, PAUSED, GAME_OVER, WON }
var game_state: GameState = GameState.WAIT_START

@export var unlock_level_on_win := 1

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	if balance_config != null:
		hp = balance_config.player_hp
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
		if child.has_signal("fired_projectile"):
			child.fired_projectile.connect(_on_enemy_fired_projectile)
		if child.has_signal("reached_goal"):
			child.process_mode = Node.PROCESS_MODE_PAUSABLE
			child.reached_goal.connect(_on_goal_reached)
		if child.has_signal("triggered"):
			child.process_mode = Node.PROCESS_MODE_PAUSABLE
			child.triggered.connect(_on_event_triggered)
		if child.has_signal("defeated"):
			child.process_mode = Node.PROCESS_MODE_PAUSABLE
			child.defeated.connect(_on_boss_defeated)
	remaining_coins = total_coins
	goal_unlocked = remaining_coins == 0
	_debug_log("Coins total: %d" % total_coins)
	# Start gate via state machine.
	_set_game_state(GameState.WAIT_START)
	_refresh_objective_status()

func _on_boss_defeated(boss_position: Vector2) -> void:
	if game_state != GameState.PLAYING:
		return
	if boss_reward_granted:
		return

	boss_defeated = true
	boss_reward_granted = true
	var boss_exit_gate := get_node_or_null("BossExitGate")
	if boss_exit_gate != null:
		boss_exit_gate.queue_free()
	boss_reward_count += boss_reward_amount
	collected_count += boss_reward_amount
	if SaveManager != null:
		SaveManager.try_update_best_score(collected_count)
	_refresh_score_label()
	_refresh_goal_unlock()
	_refresh_objective_status()
	if hud != null and hud.has_method("show_boss_result"):
		hud.call("show_boss_result", boss_reward_amount)
	print("Boss reward granted: +%d at %s" % [boss_reward_amount, boss_position])

func _on_coin_collected() -> void:
	if game_state != GameState.PLAYING:
		return
	collected_count += 1
	if SaveManager != null:
		SaveManager.try_update_best_score(collected_count)
	remaining_coins = max(remaining_coins - 1, 0)
	_refresh_score_label()
	_debug_log("Collected: %d / %d" % [collected_count, total_coins])
	_refresh_goal_unlock()
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
	if hud != null and hud.has_method("show_hit_feedback"):
		hud.call("show_hit_feedback")
	if player != null and player.has_method("show_hit_flash"):
		player.call("show_hit_flash")
	_debug_log("HP: %d" % hp)
	if hp <= 0:
		_set_game_state(GameState.GAME_OVER)

func _on_enemy_hit_player() -> void:
	_on_hazard_hit()

func _on_enemy_fired_projectile(projectile: Node) -> void:
	if game_state != GameState.PLAYING:
		projectile.queue_free()
		return
	add_child(projectile)
	projectile.process_mode = Node.PROCESS_MODE_PAUSABLE
	if projectile.has_signal("hit_player"):
		projectile.hit_player.connect(_on_enemy_hit_player)

func _refresh_hp_label() -> void:
	if hud != null and hud.has_method("set_hp"):
		hud.call("set_hp", hp)

func _get_required_score() -> int:
	var required_score := total_coins
	if balance_config != null:
		required_score = min(balance_config.required_coins, total_coins)
	return required_score

func _refresh_goal_unlock() -> void:
	if goal_unlocked:
		return
	if collected_count < _get_required_score():
		return

	goal_unlocked = true
	_debug_log("Goal unlocked")

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
		hud.call("set_objective_status", goal_unlocked, collected_count, _get_required_score())

func _debug_log(message: String) -> void:
	if debug_logs:
		print(message)

# New event setup template:
# 1. Add an event_trigger.tscn instance under the level root.
# 2. Set a unique event_id, for example: intro_message.
# 3. Set target_action to one of the actions handled below.
# 4. Run the scene and verify: first trigger works, repeated trigger is ignored,
#    restart reloads the event state.
func _on_event_triggered(event_id: String, target_action: String) -> void:
	if game_state != GameState.PLAYING:
		return
	if event_id.is_empty():
		push_warning("Event trigger ignored: empty event_id")
		return
	if triggered_event_ids.has(event_id):
		_debug_log("Event already triggered: %s" % event_id)
		return

	triggered_event_ids[event_id] = true
	_debug_log("Event triggered: %s -> %s" % [event_id, target_action])

	match target_action:
		"show_message":
			if hud != null and hud.has_method("show_event_message"):
				hud.call("show_event_message", "Event: %s" % event_id)
		"spawn_wave":
			call_deferred("_spawn_wave", event_id)
		_:
			push_warning("Unknown target_action: %s" % target_action)


func _spawn_wave(wave_id: String) -> void:
	if not wave_configs.has(wave_id):
		push_warning("Wave config missing: %s" % wave_id)
		return
	if wave_started.has(wave_id):
		_debug_log("Wave already started: %s" % wave_id)
		return

	var config: Dictionary = wave_configs[wave_id]
	var enemy_scene: PackedScene = config.get("enemy_scene")
	if enemy_scene == null:
		push_warning("Wave enemy scene missing: %s" % wave_id)
		return

	wave_started[wave_id] = true
	for spawn_point: Vector2 in config.get("spawn_points", []):
		var enemy := enemy_scene.instantiate()
		enemy.global_position = spawn_point
		enemy.process_mode = Node.PROCESS_MODE_PAUSABLE
		enemy.add_to_group("enemies")
		add_child(enemy)

		if enemy.has_signal("hit_player"):
			enemy.hit_player.connect(_on_enemy_hit_player)
		if enemy.has_signal("fired_projectile"):
			enemy.fired_projectile.connect(_on_enemy_fired_projectile)
		enemy.tree_exited.connect(_on_wave_enemy_exited.bind(wave_id))

	_debug_log("Wave spawned: %s" % wave_id)

func _on_wave_enemy_exited(wave_id: String) -> void:
	call_deferred("_check_wave_cleared", wave_id)


func _check_wave_cleared(wave_id: String) -> void:
	if not wave_started.has(wave_id):
		return
	if wave_cleared.has(wave_id):
		return
	if get_tree().get_node_count_in_group("enemies") > 0:
		return

	wave_cleared[wave_id] = true

	var config: Dictionary = wave_configs.get(wave_id, {})
	var unlock_target_name: String = config.get("unlock_target", "")
	var unlock_target := get_node_or_null(unlock_target_name)
	if unlock_target != null:
		unlock_target.queue_free()

	if hud != null and hud.has_method("show_event_message"):
		hud.call("show_event_message", "Wave cleared: %s" % wave_id)

	_debug_log("Wave cleared: %s" % wave_id)
