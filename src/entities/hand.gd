extends Node2D


func _physics_process(delta):
	position = lerp(position, GlobalController.get_hand_dir(get_parent().id)*10, delta*30)
