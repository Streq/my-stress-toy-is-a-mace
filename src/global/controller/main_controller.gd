extends Control

var controllers

var current

func set_current_players(amount:int):
	for controller in controllers.get_children():
		controller.visible = false
	match amount:
		1:
			current = controllers.get_node("single_player")
		2:
			current = controllers.get_node("two_player")
	current.visible = true

func _ready():
	if OS.has_touchscreen_ui_hint():
		$desktop.queue_free()
		controllers = $mobile
	else:
		$mobile.queue_free()
		controllers = $desktop
	

func get_dir(id:int)->Vector2:
	return current.get_dir(id)

func get_hand_dir(id:int)->Vector2:
	return current.get_hand_dir(id)
