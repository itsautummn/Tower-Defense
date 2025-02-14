extends PathFollow2D

signal health_depleted
signal lived
signal died

@onready var death_label = preload("res://Mobs/On Death/death_label.tscn" )

const MAX_HEALTH = 50
const REWARD = 5
const DAMAGE = 25

var health = MAX_HEALTH

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ProgressBar.max_value = MAX_HEALTH
	$ProgressBar.value = MAX_HEALTH


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio += .05 * delta
	if progress_ratio == 1:
		lived.emit(DAMAGE)
		Globals.add_mob_missed()
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("projectile"):
		health_depleted.emit(area.DAMAGE)


func _on_health_depleted(amount) -> void:
	health -= amount
	$ProgressBar.value -= amount
	Globals.add_damage_dealt(amount)
	if health <= 0:
		died.emit(REWARD)

func _on_death(reward) -> void:
	var label = death_label.instantiate()
	label.text = "+$" + str(reward)
	label.global_position = global_position
	get_tree().root.add_child(label)
	Globals.add_mob_killed()
	queue_free()
