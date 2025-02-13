extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(self, "position", global_position + Vector2(0, -8), .75)
	await tween.finished
	queue_free()
