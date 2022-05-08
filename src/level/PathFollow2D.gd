extends PathFollow2D


export var mob:PackedScene
export var limit := -1

onready var timer = $Timer

var instances := 0

func _on_Timer_timeout():
	spawn()

func decrease():
	instances-=1
	if timer.is_stopped():
		timer.start()
func spawn():
	timer.wait_time *= 0.99
	instances += 1
	if limit != -1 and instances >= limit:
		timer.stop()
	self.unit_offset = rand_range(0.0, 1.0)
	var _mob = mob.instance()
	_mob.connect("tree_exited", self, "decrease")
	get_parent().call_deferred("add_child", _mob)
	_mob.set_deferred("global_position", global_position)
	_mob.set_deferred("global_rotation_degrees", global_rotation_degrees-90)
	
