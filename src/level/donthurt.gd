extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.connect("lost", self, "set_invisible")
	Global.connect("stressed_out", self, "set_invisible")


func set_invisible(val):
	visible = !val
