extends KinematicBody2D

signal stress_changed(val)

onready var mace = $hand/mace

var velocity := Vector2()
var inertia := Vector2()

export var speed := 100.0
export var stress := 0.0 setget set_stress
export var max_stress := 100.0

func _ready():
	Global.current_time = 0.0
	connect("stress_changed", $"/root/HUD/HBoxContainer/TextureProgress", "_on_player_stress_changed")

func _physics_process(delta):
	var dir = InputUtils.get_input_dir().normalized()
	
	var look_dir = InputUtils.get_hand_dir(self).normalized()
	$Sprite.rotation = look_dir.angle()
	
	velocity = dir*speed
	inertia = inertia * (1.0 - delta*5)

	velocity = move_and_slide(velocity + inertia)
	
	Global.current_time += delta
	
	if !mace.is_swinging():
		self.stress += delta*20
	else:
		self.stress -= delta*5

func set_stress(val):
	stress = clamp(val, 0, max_stress)
	emit_signal("stress_changed", stress)
	if stress == max_stress:
		get_tree().reload_current_scene()
