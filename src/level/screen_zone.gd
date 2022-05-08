extends Area2D


func _on_screen_zone_body_exited(body):
	body.queue_free()
