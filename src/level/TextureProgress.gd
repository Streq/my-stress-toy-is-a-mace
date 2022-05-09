extends TextureProgress


func _ready():
	var player = get_tree().get_nodes_in_group("player")[0]
	player.connect("stress_changed", self, "_on_player_stress_changed")
	

func _on_player_stress_changed(val):
	if value <= val:
		modulate = Color.red
	else:
		modulate = Color.white
	
	value = val
