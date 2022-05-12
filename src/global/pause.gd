extends CanvasLayer
var can_pause = true
var pause = false

func _input(event):
	if event.is_action_pressed("pause") and can_pause:
		pause = !pause
		get_tree().paused = pause
		$Control.visible = pause

