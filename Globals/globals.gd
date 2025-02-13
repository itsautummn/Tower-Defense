extends Node


var money: int = 0


func add_money(amount):
	money += amount


func remove_money(amount):
	money -= amount
	if money < 0:
		money = 0
