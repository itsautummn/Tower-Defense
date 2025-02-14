extends Control

var owned_towers = {0: 3}


func _on_tower_bought(type: Towers.tower) -> void:
	add_tower(type, 1)


func add_tower(type: Towers.tower, amount: int):
	owned_towers[type] = owned_towers.get(type, 0) + amount
	

func remove_tower(type: Towers.tower, amount: int):
	if owned_towers.has(type):
		owned_towers[type] -= amount
		if owned_towers[type] <= 0:
			owned_towers.erase(type)


func _on_tower_pressed(button) -> void:
	if PlayerStates.is_placing():
		return
	if owned_towers[button.type] > 0:
		remove_tower(button.type, 1)
		button.get_node("Label").text = "x" + str(owned_towers[button.type])
