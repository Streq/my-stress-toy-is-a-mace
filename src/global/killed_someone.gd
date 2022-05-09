extends Label


func _ready():
	Global.connect("lost", self, "set_visible")
	Global.connect("stressed_out", self, "set_invisible")
	
func set_invisible(val):
	visible = false
