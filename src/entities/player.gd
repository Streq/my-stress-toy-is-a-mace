extends KinematicBody2D

signal stress_changed(val)

onready var hand = $hand/Sprite
onready var mace = $hand/mace
onready var sprite = $Sprite
onready var particles = $CPUParticles2D


var velocity := Vector2()
var inertia := Vector2()

export var speed := 100.0
export var stress := 0.0 setget set_stress
export var max_stress := 100.0
export var pacifist := true
export var stress_rate := 20.0
export var do_stress := true
var exploding = false

func _ready():
	Global._save()
	Global.time_current = 0.0
	Global.kills_current = 0
	Global.emit_signal("lost", false)
	Global.emit_signal("stressed_out", false)
	Global.pacifist = pacifist
	Global.connect("destress", self, "destress")
	if pacifist:
		sprite.self_modulate = Color.white
		hand.self_modulate = Color.white
		particles.modulate = Color.white
	else:
		sprite.self_modulate = Color.red
		hand.self_modulate = Color.red
		particles.modulate = Color.red
	
func destress():
	self.stress = 0.0
func _physics_process(delta):
	if !exploding:
		var dir = InputUtils.get_input_dir().normalized()
		
		var look_dir = InputUtils.get_hand_dir(self).normalized()
		$Sprite.rotation = look_dir.angle()
		
		velocity = dir*speed
		inertia = inertia * (1.0 - delta*5)

		velocity = move_and_slide(velocity + inertia)
		
		if pacifist:
			Global.time_current += delta
		
		if mace.is_swinging() and pacifist:
			self.stress -= delta*5
		elif do_stress:
			self.stress += delta*stress_rate
			
func set_stress(val):
	stress = clamp(val, 0, max_stress)
	emit_signal("stress_changed", stress)
	if stress == max_stress and !exploding:
		exploding = true
		$AnimationPlayer.play("exploding")

func explode():
	Global.emit_signal("stressed_out", true)
	NodeUtils.reparent(particles, get_parent())
	particles.emitting = true
	particles.global_position = global_position
	
	queue_free()
