extends Node
const SAVE_PATH := "user://save.cfg"
const SECTION_PROGRESS := "progress"
const SECTION_SETTINGS := "settings"
var best_score := 0
var audio_volume := 1.0
var unlocked_level := 1

func _ready() -> void:
	load_save()

func load_save() -> void:
	var cfg := ConfigFile.new()
	var err := cfg.load(SAVE_PATH)
	if err != OK:
		_apply_defaults()
		save_now()
		print("Save created with defaults")
		return
	best_score = int(cfg.get_value(SECTION_PROGRESS, "best_score", 0))
	unlocked_level = int(cfg.get_value(SECTION_PROGRESS, "unlocked_level", 1))
	audio_volume = float(cfg.get_value(SECTION_SETTINGS, "audio_volume", 1.0))
	print("Save loaded: best=%d unlocked=%d volume=%.2f" % [best_score, unlocked_level, audio_volume])

func _apply_defaults() -> void:
	best_score = 0
	audio_volume = 1.0
	unlocked_level = 1

func save_now() -> void:
	var cfg := ConfigFile.new()
	cfg.set_value(SECTION_PROGRESS, "best_score", best_score)
	cfg.set_value(SECTION_PROGRESS, "unlocked_level", unlocked_level)
	cfg.set_value(SECTION_SETTINGS, "audio_volume", audio_volume)
	var err := cfg.save(SAVE_PATH)
	if err != OK:
		push_warning("Save failed. err=%d" % err)

func try_update_best_score(score: int) -> void:
	if score > best_score:
		best_score = score
		save_now()

func unlock_level(level: int) -> void:
	if level > unlocked_level:
		unlocked_level = level
		save_now()

func set_audio_volume(value: float) -> void:
	audio_volume = clampf(value, 0.0, 1.0)
	save_now()
