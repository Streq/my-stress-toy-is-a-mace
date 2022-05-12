extends Button



func _on_tutorial_pressed():
	get_tree().change_scene_to(preload("res://src/level/tutorial.tscn"))


func _ready():
	Global.connect("tutorial", self, "_on_tutorial")
	_on_tutorial(Global.pacifist)
	connect("pressed", self, "_on_tutorial_pressed")

func _on_tutorial(val):
	disabled = !val
	if !disabled:
		NodeUtils.reparent_deferred(self, get_parent())
