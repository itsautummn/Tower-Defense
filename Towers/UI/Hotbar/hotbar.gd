extends ColorRect

var new_pos: Vector2 = Vector2(240, 344)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = lerp(position, new_pos, .25)


func _on_mouse_entered() -> void:
	new_pos = Vector2(240, 312)


func _on_mouse_exited() -> void:
	new_pos = Vector2(240, 344)
