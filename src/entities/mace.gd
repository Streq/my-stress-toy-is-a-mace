extends KinematicBody2D


var velocity := Vector2()
export var acceleration := 10.0
export var length := 10
export var stretch_length := 20


# Called when the node enters the scene tree for the first time.
func _ready():
	var p = global_position
	set_as_toplevel(true)
	global_position = p

func _physics_process(delta):
	var parent_pos = get_parent().global_position
	var pos = global_position
	var dist = (parent_pos-pos)
	if length*length < dist.length_squared():
		var norm = (parent_pos-global_position).normalized()
		var stretch = (dist.length_squared()-length*length)
		velocity += norm*acceleration*stretch*delta
#		get_parent().inertia -= norm*acceleration*stretch*0.0*delta
		
	
		var projection : Vector2 = velocity.project(norm)
		print(projection.dot(norm))
		if projection.dot(norm) < 0:
			velocity -= projection
		
		
	velocity = move_and_slide(velocity)
	velocity = velocity * (1.0-delta)
	
	dist = (parent_pos-global_position)
	if stretch_length*stretch_length < dist.length_squared():
		
		var norm = (parent_pos-global_position).normalized()
		global_position = parent_pos - norm * stretch_length
