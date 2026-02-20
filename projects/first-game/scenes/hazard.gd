extends Area2D

signal hit

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node) -> void:
	if body.name != "Player":
		return
	hit.emit()
