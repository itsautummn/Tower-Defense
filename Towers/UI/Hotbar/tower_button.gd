extends TextureButton

signal confirmed_pressed

@export var type: PlayerStates.place

var count: int = 3

func _ready() -> void:
	_update_label()

func _on_pressed() -> void:
	if PlayerStates.is_placing():
		return
	if count > 0:
		count -= 1
		_update_label()
		confirmed_pressed.emit(type)

func _update_label() -> void:
	$Label.text = "x" + str(count)
