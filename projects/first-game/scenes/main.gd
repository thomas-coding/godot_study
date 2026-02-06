extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_just_pressed("jump"):
		print("jump OK")
