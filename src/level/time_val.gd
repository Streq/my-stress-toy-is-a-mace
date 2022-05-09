extends Label

func _ready():
	Global.connect("time_current", self, "_on_time_changed")
	_on_time_changed(Global.time_current)
	
func _on_time_changed(val):
	text = "%10.3f" % val
