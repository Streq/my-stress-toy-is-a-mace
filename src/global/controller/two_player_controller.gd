extends Control



func get_dir(id:int)->Vector2:
	return get_children()[id].get_dir()


func get_hand_dir(id:int)->Vector2:
	return get_children()[id].get_hand_dir()
	
