extends Controller

onready var movement = $movement
onready var hand = $hand


func _ready():
	if !OS.has_touchscreen_ui_hint():
		queue_free()


func get_dir()->Vector2:
	return movement.get_dir()


func get_hand_dir()->Vector2:
	return hand.get_dir()
	
