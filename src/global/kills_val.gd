extends Label

func _ready():
	Global.connect("current_kills", self, "_on_kills_changed")
	_on_kills_changed(Global.current_kills)
func _on_kills_changed(val):
	text = str(val)
