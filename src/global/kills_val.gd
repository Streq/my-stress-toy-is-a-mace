extends Label

func _ready():
	Global.connect("kills_current", self, "_on_kills_changed")
	_on_kills_changed(Global.kills_current)
func _on_kills_changed(val):
	text = "%4d" % val
