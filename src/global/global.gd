extends Node

signal time_current(val)
signal time_record(val)
signal kills_current(val)
signal kills_record(val)
signal lost(val)
signal stressed_out(val)
signal destress()
signal kill()
signal pacifist(val)

var time_current = 0.0 setget set_time_current
var time_record = 0.0
var kills_current := 0 setget set_kills_current
var kills_record := 0

var pacifist = true setget set_pacifist
var timer : Timer


func _ready():
	_load()
	timer = Timer.new()
	timer.autostart = false
	timer.one_shot = true
	timer.wait_time = 3.0
	timer.connect("timeout", self, "restart")
	add_child(timer)
	connect("lost", self, "_on_lost")
	connect("stressed_out", self, "_on_lost")
	
func restart():
	_save()
	get_tree().reload_current_scene()


func set_time_current(val):
	time_current = val
	if val > time_record:
		time_record = val
		emit_signal("time_record", val)
	emit_signal("time_current", val)

func _on_someone_died():
	if pacifist:
		emit_signal("lost",true)
	else:
		emit_signal("destress")
		self.kills_current += 1

func _on_lost(val):
	if val:
		timer.start()
	
func set_kills_current(val):
	kills_current = val
	if val > kills_record:
		kills_record = val
		emit_signal("kills_record", val)
	emit_signal("kills_current", val)
func set_pacifist(val):
	pacifist = val
	emit_signal("pacifist", val)
	
func _save():
	var save = {
		"time" : time_record,
		"kills" : kills_record
	}
	
	var save_game = File.new()
	save_game.open("user://stress_toy_mace_savegame.save", File.WRITE)
	save_game.store_var(save)
	
	pass
	
func _load():
	var save_game = File.new()

	if save_game.open("user://stress_toy_mace_savegame.save", File.READ) == 0:
		var save = save_game.get_var()
		time_record = save["time"]
		kills_record = save["kills"]

