extends TextureButton

signal place_tower_pressed

func _on_pressed() -> void:
	if PlayerStates.is_placing():
		place_tower_pressed.emit(self)
