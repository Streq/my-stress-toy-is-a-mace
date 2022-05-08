extends TextureProgress


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_player_stress_changed(val):
	if value <= val:
		modulate = Color.red
	else:
		modulate = Color.white
	
	value = val
