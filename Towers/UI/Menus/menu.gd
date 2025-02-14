extends ColorRect

var new_pos: Vector2
@export var open_pos: Vector2
@export var close_pos: Vector2

func _ready():
	new_pos = close_pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = lerp(position, new_pos, .25)


func _on_mouse_entered() -> void:
	new_pos = open_pos


func _on_mouse_exited() -> void:
	new_pos = close_pos
