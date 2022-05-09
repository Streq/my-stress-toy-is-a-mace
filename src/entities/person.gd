extends KinematicBody2D

export var speed := 100.0
onready var particles = $CPUParticles2D
onready var death_timer = $death_timer

func _physics_process(delta):
	move_local_x(delta*speed)


func _on_hurtbox_body_entered(body):
	if body.is_swinging():
		queue_free()
		NodeUtils.reparent(particles, get_parent())
		NodeUtils.reparent(death_timer, get_parent())
		particles.emitting = true
		death_timer.wait_time = particles.lifetime
		death_timer.start()
		Global.emit_signal("lost", true)
		particles.global_rotation = body.velocity.angle()
		particles.global_position = global_position
