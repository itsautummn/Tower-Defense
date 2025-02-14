extends Node

var current
enum state {
	NOTHING,
	PLACING
}

var placing: Towers.tower

func change_state(new):
	current = new

func is_placing() -> bool:
	return current == state.PLACING

func change_placing(new) -> Texture2D:
	placing = new
	return Towers.cursors[new]
