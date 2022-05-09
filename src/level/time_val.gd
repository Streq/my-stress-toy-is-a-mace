extends Label

func _ready():
	Global.connect("current_time", self, "_on_time_changed")
	_on_time_changed(Global.current_time)
	
func _on_time_changed(val):
	text = "%10.3f" % val
