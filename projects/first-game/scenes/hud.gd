extends CanvasLayer
@onready var score_label: Label = get_node_or_null("ScoreLabel")
@onready var hp_label: Label = get_node_or_null("HpLabel")
@onready var restart_label: Label = get_node_or_null("RestartLabel")
@onready var start_label: Label = get_node_or_null("StartLabel")
@onready var pause_label: Label = get_node_or_null("PauseLabel")
@onready var game_over_label: Label = get_node_or_null("GameOverLabel")
@onready var win_label: Label = get_node_or_null("WinLabel")
@onready var objective_label: Label = get_node_or_null("ObjectiveLabel")
@onready var settings_button: Button = get_node_or_null("SettingsButton")
@onready var pause_overlay: ColorRect = get_node_or_null("PauseOverlay")
@onready var settings_panel: Control = get_node_or_null("SettingsPanel")
@onready var back_button: Button = get_node_or_null("SettingsPanel/Panel/VBox/BackButton")
@onready var volume_slider: HSlider = get_node_or_null("SettingsPanel/Panel/VBox/VolumeSlider")
@onready var window_mode_option: OptionButton = get_node_or_null("SettingsPanel/Panel/VBox/WindowModeOption")

func _ready() -> void:
	if settings_panel != null:
		settings_panel.visible = false
	if pause_overlay != null:
		pause_overlay.visible = false
	_setup_window_mode_option()
	_load_settings_from_save()
	if settings_button != null:
		settings_button.pressed.connect(show_settings_panel)
	if back_button != null:
		back_button.pressed.connect(_on_back_button_pressed)
	if volume_slider != null:
		volume_slider.value_changed.connect(_on_volume_slider_value_changed)
	if window_mode_option != null:
		window_mode_option.item_selected.connect(_on_window_mode_option_item_selected)
func set_score(value: int) -> void:
	if score_label != null:
		score_label.text = "Collected: %d" % value
func set_hp(value: int) -> void:
	if hp_label != null:
		hp_label.text = "HP: %d" % value
func set_state_hint(state_name: String) -> void:
	var is_wait_start := state_name == "WAIT_START"
	var is_paused := state_name == "PAUSED"
	var is_game_over := state_name == "GAME_OVER"
	var is_won := state_name == "WON"

	if start_label != null:
		start_label.visible = is_wait_start
	if pause_label != null:
		pause_label.visible = is_paused
	if game_over_label != null:
		game_over_label.visible = is_game_over
	if win_label != null:
		win_label.visible = is_won

	if not is_paused:
		if settings_panel != null:
			settings_panel.visible = false
		if pause_overlay != null:
			pause_overlay.visible = false
		_set_runtime_labels_visible(true)

	var panel_open := is_paused and settings_panel != null and settings_panel.visible
	if settings_button != null:
		settings_button.visible = is_paused and not panel_open
	if pause_overlay != null:
		pause_overlay.visible = panel_open
	if pause_label != null and is_paused:
		pause_label.visible = not panel_open
	if is_paused:
		_set_runtime_labels_visible(not panel_open)
func set_objective_status(unlocked: bool, collected: int, total: int) -> void:
	if objective_label == null:
		return
	if unlocked:
		objective_label.text = "Goal: UNLOCKED (%d/%d)" % [collected, total]
	else:
		objective_label.text = "Goal: LOCKED (%d/%d)" % [collected, total]
func show_settings_panel() -> void:
	if settings_panel != null:
		settings_panel.visible = true
	if settings_button != null:
		settings_button.visible = false
	if pause_overlay != null:
		pause_overlay.visible = true
	if pause_label != null:
		pause_label.visible = false
	_set_runtime_labels_visible(false)

func _on_back_button_pressed() -> void:
	if settings_panel != null:
		settings_panel.visible = false
	if settings_button != null:
		settings_button.visible = true
	if pause_overlay != null:
		pause_overlay.visible = false
	if pause_label != null:
		pause_label.visible = true
	_set_runtime_labels_visible(true)

func _set_runtime_labels_visible(is_visible: bool) -> void:
	if score_label != null:
		score_label.visible = is_visible
	if hp_label != null:
		hp_label.visible = is_visible
	if objective_label != null:
		objective_label.visible = is_visible
	if restart_label != null:
		restart_label.visible = is_visible

func _setup_window_mode_option() -> void:
	if window_mode_option == null:
		return
	window_mode_option.clear()
	window_mode_option.add_item("Windowed", 0)
	window_mode_option.add_item("Borderless", 1)
	window_mode_option.add_item("Fullscreen", 2)
func _load_settings_from_save() -> void:
	var saved_volume := 1.0
	var saved_window_mode := "windowed"
	if SaveManager != null:
		saved_volume = SaveManager.audio_volume
		saved_window_mode = SaveManager.window_mode
	if volume_slider != null:
		volume_slider.value = saved_volume
	_apply_audio_volume(saved_volume)
	if window_mode_option != null:
		window_mode_option.select(_window_mode_index_from_key(saved_window_mode))
	_apply_window_mode(saved_window_mode)
func _on_volume_slider_value_changed(value: float) -> void:
	_apply_audio_volume(value)
	if SaveManager != null:
		SaveManager.set_audio_volume(value)
func _apply_audio_volume(value: float) -> void:
	var linear := clampf(value, 0.0, 1.0)
	var db := -80.0
	if linear > 0.001:
		db = linear_to_db(linear)
	var bus_index := AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, db)
func _on_window_mode_option_item_selected(index: int) -> void:
	var key := _window_mode_key_from_index(index)
	_apply_window_mode(key)
	if SaveManager != null:
		SaveManager.set_window_mode(key)
func _window_mode_key_from_index(index: int) -> String:
	match index:
		1:
			return "borderless"
		2:
			return "fullscreen"
		_:
			return "windowed"
func _window_mode_index_from_key(mode_key: String) -> int:
	match mode_key.to_lower():
		"borderless":
			return 1
		"fullscreen":
			return 2
		_:
			return 0
func _apply_window_mode(mode_key: String) -> void:
	var key := mode_key.to_lower()
	match key:
		"borderless":
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		"fullscreen":
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		_:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
