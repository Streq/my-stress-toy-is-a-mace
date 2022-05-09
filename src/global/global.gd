extends Node

signal current_time(val)
signal current_record(val)
signal current_kills(val)
signal kills_record(val)
signal lost(val)
signal stressed_out(val)
signal destress()
signal kill()
signal pacifist(val)

var current_time = 0.0 setget set_current_time
var current_record = 0.0
var current_kills := 0 setget set_current_kills
var kills_record := 0

var pacifist = true setget set_pacifist
var timer : Timer


func _ready():
	timer = Timer.new()
	timer.autostart = false
	timer.one_shot = true
	timer.wait_time = 3.0
	timer.connect("timeout", self, "restart")
	add_child(timer)
	connect("lost", self, "_on_lost")
	connect("stressed_out", self, "_on_lost")
	
func restart():
	get_tree().reload_current_scene()


func set_current_time(val):
	current_time = val
	if val > current_record:
		current_record = val
		emit_signal("current_record", val)
	emit_signal("current_time", val)

func _on_someone_died():
	if pacifist:
		emit_signal("lost",true)
	else:
		emit_signal("destress")
		self.current_kills += 1

func _on_lost(val):
	if val:
		timer.start()
	
func set_current_kills(val):
	current_kills = val
	if val > kills_record:
		kills_record = val
		emit_signal("kills_record", val)
	emit_signal("current_kills", val)
func set_pacifist(val):
	pacifist = val
	emit_signal("pacifist", val)
