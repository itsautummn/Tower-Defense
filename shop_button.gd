extends TextureButton

signal bought

@export var money_label: Label
@export var type: Towers.tower
@export var cost: int


func _on_pressed() -> void:
	if pay():
		buy()


func pay() -> bool:
	if not Globals.no_money():
		Globals.remove_money(cost)
		money_label.text = "$" + str(Globals.money)
		return true
	else:
		return false
	

func buy():
	bought.emit(type)
