extends Node2D

export var players := 1

func _ready():
	print("level:", name)
	Global.timer.stop()
	
	GlobalController.set_current_players(players)
