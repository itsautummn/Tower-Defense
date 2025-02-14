extends Node

@onready var tower_scenes = [
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

enum tower {
	RANGER,
	GUNNER,
	BOMBER,
	WARLOCK
}
