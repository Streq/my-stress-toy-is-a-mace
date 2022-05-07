extends Node


var levels : Array

var current_level = -1

func _ready():
	levels = get_children()

func next_level():
	current_level += 1
	get_tree().change_scene_to(levels[current_level].scene)
	pass
func prev_level():
	current_level -= 1
	get_tree().change_scene_to(levels[current_level].scene)
