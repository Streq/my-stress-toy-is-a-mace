class_name NodeUtils

static func reparent(node: Node, to: Node)->void:
	node.get_parent().remove_child(node)
	to.add_child(node)
static func reparent_deferred(node: Node, to: Node)->void:
	node.get_parent().call_deferred("remove_child", node)
	to.call_deferred("add_child", node)
