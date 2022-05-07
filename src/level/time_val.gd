extends Label

func _ready():
	Global.connect("current_time", self, "_on_time_changed")

func _on_time_changed(val):
	text = "%10.3f" % val
