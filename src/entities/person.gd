extends KinematicBody2D

export var speed := 100.0
onready var particles = $CPUParticles2D
onready var display = $Sprite

signal died()

func _ready():
	connect("died", Global, "_on_someone_died")
	if !Global.pacifist:
		display.modulate = Color.white
		particles.modulate = Color.white
	else:
		display.modulate = Color.red
		particles.modulate = Color.red

func _physics_process(delta):
	move_local_x(delta*speed)


func _on_hurtbox_body_entered(body):
	if body.is_swinging():
		queue_free()
		NodeUtils.reparent(particles, get_parent())
		particles.emitting = true
		particles.global_rotation = body.velocity.angle()
		particles.global_position = global_position
		emit_signal("died")
