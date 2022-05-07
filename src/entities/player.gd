extends KinematicBody2D

var velocity := Vector2()
var inertia := Vector2()
export var speed := 100.0

func _ready():
	Global.current_time = 0.0

func _physics_process(delta):
	var dir = InputUtils.get_input_dir().normalized()
	
	var look_dir = InputUtils.get_hand_dir().normalized()
	$Sprite.rotation = look_dir.angle()
	
	velocity = dir*speed
	inertia = inertia * (1.0 - delta*5)

	velocity = move_and_slide(velocity + inertia)
	
	Global.current_time += delta
	
