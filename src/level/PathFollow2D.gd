extends PathFollow2D


export var mob:PackedScene
export var limit := -1

onready var timer = $Timer

var instances := 0


export var wait := 1.0
export var wait_max := 1.0
export var wait_min := 0.3
export var wait_factor := 0.99

export var spawn_movement_speed = 1.0
export var spawn_movement_speed_max := 1.5
export var spawn_movement_speed_min := 1.0
export var speed_up_factor := 1.00


func _on_Timer_timeout():
	spawn()

func decrease():
	instances-=1
	if timer.is_stopped():
		timer.start()
func spawn():
	wait = clamp(wait*wait_factor, wait_min, wait_max)
	timer.wait_time = wait
	
	instances += 1
	if limit != -1 and instances >= limit:
		timer.stop()
	
	self.unit_offset = rand_range(0.0, 1.0)
	var _mob = mob.instance()
	_mob.connect("tree_exited", self, "decrease")
	get_parent().call_deferred("add_child", _mob)
	_mob.set_deferred("global_position", global_position)
	_mob.set_deferred("global_rotation_degrees", global_rotation_degrees-90)
	_mob.speed *= spawn_movement_speed
	spawn_movement_speed = clamp(spawn_movement_speed*speed_up_factor, spawn_movement_speed_min, spawn_movement_speed_max)
