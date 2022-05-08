extends KinematicBody2D

export var speed := 100.0


func _physics_process(delta):
	move_local_x(delta*speed)


func _on_hurtbox_body_entered(body):
	if body.is_swinging():
		get_tree().reload_current_scene()
