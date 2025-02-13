extends Node2D

const DAMAGE = 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.translate(Vector2(1, 0).rotated(rotation) * 800 * delta)


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("mob"):
		queue_free()
