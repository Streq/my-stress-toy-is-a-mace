extends Timer



func _on_death_timer_timeout():
	get_tree().reload_current_scene()
