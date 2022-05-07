extends Label


func _ready():
	Global.connect("current_record", self, "_on_time_changed")

func _on_time_changed(val):
	text = "%6.3f" % val
