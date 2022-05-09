extends Node2D


func _physics_process(delta):
	position = lerp(position, InputUtils.get_hand_dir(get_parent())*10, delta*30)
