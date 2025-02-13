extends Node2D


@onready var arrow_scene = preload("res://Projectiles/arrow.tscn")

# A queue of entities that are currently in the fire radius
# A mob will be added when they enter and removed when they leave
var mob_queue: Array[Area2D]


func _on_timer_timeout() -> void:
	if not mob_queue.is_empty():
		fire()
		$Timer.start()
	

func fire():
	var mob = mob_queue.front()
	while not mob_queue.is_empty() and not is_instance_valid(mob): # While there are still invalid instances in the queue
		mob_queue.pop_front()
		mob = mob_queue.front()
	if not mob_queue.is_empty():
		var arrow = arrow_scene.instantiate()
		arrow.rotation = global_position.angle_to_point(mob.global_position)
		add_child.call_deferred(arrow)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("mob"):
		var first = mob_queue.is_empty() # If this is the first mob to enter when queue is empty
		mob_queue.append(area)
		if first and $Timer.is_stopped():	
			fire()
			$Timer.start()


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("mob"):
		mob_queue.pop_front()
