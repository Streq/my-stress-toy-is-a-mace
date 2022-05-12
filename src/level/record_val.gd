extends Label


func _ready():
	Global.connect("time_record", self, "_on_time_changed")
	_on_time_changed(Global.time_record)

func _on_time_changed(val):
	text = "%7.3f" % val
	print(val)
