extends Area2D
signal reached_goal

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node) -> void:
	if body.name != "Player":
		return
	reached_goal.emit()
