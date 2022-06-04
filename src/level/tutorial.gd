extends Node


func _ready():
	Global.tutorial = true
#	HudMenu.visible = false


func _exit_tree():
	Global.tutorial = false
	HudMenu.visible = true
