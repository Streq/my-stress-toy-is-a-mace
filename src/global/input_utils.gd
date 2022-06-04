extends Node
class_name InputUtils

static func get_input_dir() -> Vector2:
	return GlobalController.get_dir(0)
static func get_desktop_input_dir() -> Vector2:
	return Vector2(
			float(Input.is_action_pressed("right")) - float(Input.is_action_pressed("left")),
			float(Input.is_action_pressed("down")) - float(Input.is_action_pressed("up"))
		).normalized()

static func get_hand_dir() -> Vector2:
	return GlobalController.get_hand_dir(0)
#	if OS.has_touchscreen_ui_hint():
#		return HudMobile.hand.get_dir()
#	else:
#		var dist = get_dist_to_mouse(node)
#		return dist if dist.length_squared()<1.0 else dist.normalized()
		
static func get_dir_to_mouse(node:CanvasItem):
	var dist = get_dist_to_mouse(node)
	return dist if dist.length_squared()<1.0 else dist.normalized()


static func get_dist_to_mouse(node:CanvasItem) -> Vector2:
	var mouse_viewport_position := node.get_viewport().get_mouse_position()
	var node_viewport_position := node.get_global_transform_with_canvas().origin
	return mouse_viewport_position-node_viewport_position
