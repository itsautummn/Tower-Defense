extends TextureButton

signal confirmed_pressed

var type: Towers.tower

func _on_pressed() -> void:
	confirmed_pressed.emit(self)
