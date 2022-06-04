extends Controller

var player = null

func _ready():
	if get_tree().has_group("player"):
		player = get_tree().get_nodes_in_group("player")[0]
	
	get_tree().connect("node_added", self, "_on_node_added")
func _on_node_added(node:Node):
	if node.is_in_group("player"):
		player = get_tree().get_nodes_in_group("player")[0]
	
func get_dir()->Vector2:
	return InputUtils.get_desktop_input_dir()
	
func get_hand_dir()->Vector2:
	return InputUtils.get_dir_to_mouse(player)
