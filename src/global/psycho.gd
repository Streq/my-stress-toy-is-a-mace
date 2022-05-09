extends Button



func _on_psycho_pressed():
	get_tree().change_scene_to(preload("res://src/level/psycho.tscn"))


func _ready():
	Global.connect("pacifist", self, "_on_pacifist")
	_on_pacifist(Global.pacifist)
	connect("pressed", self, "_on_psycho_pressed")

func _on_pacifist(val):
	disabled = !val
	if !disabled:
		NodeUtils.reparent_deferred(self, get_parent())
