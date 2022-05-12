extends Label

func _ready():
	Global.connect("kills_record", self, "_on_kills_record_changed")
	_on_kills_record_changed(Global.kills_record)
func _on_kills_record_changed(val):
	text = "%4d" % val
