extends Node2D

func _ready():
	print("level:", name)
	Global.timer.stop()