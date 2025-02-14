extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GridContainer/MKNum.text = str(Globals.mobs_killed)
	$GridContainer/MMNum.text = str(Globals.mobs_missed)
	$GridContainer/DDNum.text = str(Globals.damage_dealt)
	$GridContainer/HLNum.text = str(Globals.highest_level)
	Globals.find_most_used_tower()
	$GridContainer/MUTNum.text = str(Globals.most_used_tower)
	get_tree().paused = true
