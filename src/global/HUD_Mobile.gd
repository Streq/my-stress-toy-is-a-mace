extends Control

onready var movement = $movement
onready var hand = $hand


func _ready():
	if !OS.has_touchscreen_ui_hint():
		queue_free()
