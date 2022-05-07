extends Area2D



func _on_goal_area_entered(area):
	Levels.next_level()
