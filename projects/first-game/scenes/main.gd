extends Node2D
var collected_count := 0
var hp := 3

@onready var hud: Node = get_node_or_null("HUD")

enum GameState { WAIT_START, PLAYING, PAUSED, GAME_OVER, WON }
var game_state: GameState = GameState.WAIT_START

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	var player := get_node_or_null("Player")
	if player != null:
		# Main stays always-on for pause hotkeys; gameplay nodes must be pausable.
		player.process_mode = Node.PROCESS_MODE_PAUSABLE
	_refresh_score_label()
	_refresh_hp_label()
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
	# Start gate via state machine.
	_set_game_state(GameState.WAIT_START)

func _on_coin_collected() -> void:
	if game_state != GameState.PLAYING:
		return
	collected_count += 1
	_refresh_score_label()
	print("Collected: %d" % collected_count)

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
	hp -= 1
	_refresh_hp_label()
	print("HP: %d" % hp)
	if hp <= 0:
		_set_game_state(GameState.GAME_OVER)

func _refresh_hp_label() -> void:
	if hud != null and hud.has_method("set_hp"):
		hud.call("set_hp", hp)

func _on_goal_reached() -> void:
	if game_state != GameState.PLAYING:
		return
	_set_game_state(GameState.WON)
	print("YOU WIN")

func _set_game_state(next_state: GameState) -> void:
	game_state = next_state
	print("State -> %s" % GameState.keys()[game_state])
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
