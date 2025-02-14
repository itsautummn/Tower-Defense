extends Node

# Money stats
var money: int = 0
func add_money(amount):
	money += amount
func remove_money(amount):
	money -= amount
	if money < 0:
		money = 0
func no_money() -> bool:
	return money == 0

# Stats for game over
var towers_used_dict = {}
func add_used_towers(name: String):
	towers_used_dict[name] = towers_used_dict.get(name, 0) + 1
	
var most_used_tower
func find_most_used_tower():
	most_used_tower = towers_used_dict.find_key(towers_used_dict.values().max())
	
var mobs_killed = 0
func add_mob_killed():
	mobs_killed += 1
	
var mobs_missed = 0
func add_mob_missed():
	mobs_missed += 1
	
var damage_dealt = 0
func add_damage_dealt(amount):
	damage_dealt += amount
	
var highest_level = 0
func increase_level():
	highest_level += 1
