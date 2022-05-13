extends Area2D

onready var big_circle = $big_circle
onready var small_circle = $small_circle
onready var shape = $CollisionShape2D



var touched = false
var index = -1
var dir := Vector2()

func _input(event):
	if event is InputEventScreenTouch:
		var e : InputEventScreenTouch = event
		if index == e.index and !e.pressed:
				touched = false
				index = -1
				small_circle.position = Vector2.ZERO
		elif e.position.distance_to(big_circle.global_position) < shape.shape.radius and e.pressed:
				touched = true
				index = e.index
				small_circle.global_position = e.position
	elif event is InputEventScreenDrag:
		var e : InputEventScreenDrag = event
		if touched and e.index == index:
			small_circle.global_position = e.position
	
	if small_circle.position.length() > shape.shape.radius:
		small_circle.position = small_circle.position.normalized() * shape.shape.radius
	
func get_dir():
	return small_circle.position / shape.shape.radius
