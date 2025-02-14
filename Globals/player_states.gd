extends Node

@onready var placables = [
	preload("res://Towers/Halfling Ranger/halfing_ranger.tscn"),
	null,
	null,
	null
]

@onready var cursors = [
	preload("res://Towers/Halfling Ranger/1x_halfing_ranger.png"),
	null,
	null,
	null
]

var tower_names = [
	"Ranger",
	null,
	null,
	null
]

var current
enum state {
	NOTHING,
	PLACING
}

var placing
enum place {
	RANGER,
	GUNNER,
	BOMBER,
	WARLOCK
}

func change_state(new):
	current = new

func is_placing() -> bool:
	return current == state.PLACING

func change_placing(new) -> Texture2D:
	placing = new
	return cursors[new]
