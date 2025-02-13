extends Node2D


@onready var hr_scene = preload("res://Towers/Halfling Ranger/halfing_ranger.tscn")
@onready var placement_cursor = preload("res://Towers/UI/Cursor/placement_cursor.tscn")
@onready var goblin_scene = preload("res://Mobs/Goblin/goblin.tscn")


const MAX_LIFE: float = 100.0

var life: float


func _ready():
	life = MAX_LIFE
	$CanvasLayer/PlayUI/LifeBar.max_value = MAX_LIFE
	$CanvasLayer/PlayUI/LifeBar.value = life


func spawn():
	for i in 5:
		$Path2D/Timer.start()
		spawn_goblin()
		await $Path2D/Timer.timeout


func spawn_goblin():
	var goblin = goblin_scene.instantiate()
	$Path2D.add_child(goblin)
	goblin.lived.connect(_on_mob_lived)
	goblin.died.connect(_on_mob_death)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_spawn"):
		spawn()


func _on_tower_button_pressed(placing) -> void:
	PlayerStates.change_state(PlayerStates.state.PLACING)
	var cursor = placement_cursor.instantiate()
	cursor.texture = PlayerStates.change_placing(placing)
	$CursorParent.add_child(cursor)


func _on_place_tower_spot_pressed(spot) -> void:
	var tower = PlayerStates.placables[PlayerStates.placing].instantiate()
	$Towers.add_child(tower)
	tower.global_position = spot.global_position + Vector2(8, 0) # BUG: Don't know the root cause but its position is off if I don't do this
	spot.get_child(0).visible = false # Only child of spot should be the exlam point
	PlayerStates.change_state(PlayerStates.state.NOTHING)
	$CursorParent.get_child(0).queue_free()


func _on_mob_lived(damage):
	lose_life(damage)


func _on_mob_death(reward):
	add_money(reward)


func add_money(amount):
	Globals.add_money(amount)
	_update_money_ui()
	

func _update_money_ui():
	$CanvasLayer/PlayUI/MoneyBackground/Money.text = "$" + str(Globals.money)


func lose_life(amount):
	life -= amount
	if life < 0:
		life = 0
	_update_life_ui()


func _update_life_ui():
	$CanvasLayer/PlayUI/LifeBar.value = life
