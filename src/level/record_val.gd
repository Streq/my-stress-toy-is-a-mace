extends Label


func _ready():
	Global.connect("current_record", self, "_on_time_changed")
	_on_time_changed(Global.current_record)

func _on_time_changed(val):
	text = "%10.3f" % val
	print(val)
