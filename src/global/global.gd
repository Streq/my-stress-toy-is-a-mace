extends Node

signal current_time(val)
signal current_record(val)

var current_time = 0.0 setget set_current_time
var current_record = 0.0


func set_current_time(val):
	current_time = val
	if val > current_record:
		current_record = val
		emit_signal("current_record", val)
	emit_signal("current_time", val)
