extends Sprite2D

var up_pos = Vector2(8, -8)
var down_pos = Vector2(8, 0)
var tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	up()


func up():
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self, "position", up_pos, 1)
	await tween.finished
	down()

func down():
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self, "position", down_pos, 1)
	await tween.finished
	up()
