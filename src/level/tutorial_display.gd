extends Control

signal sike

var phase = 0
var player = null
var mace = null
# Called when the node enters the scene tree for the first time.
func _ready():
	
	Pause.can_pause = false
	player = get_tree().get_nodes_in_group("player")[0]
	mace = get_tree().get_nodes_in_group("mace")[0]
	$good.visible = false
	$good2.visible = false
	$good3.visible = false
	$time_label.visible = false
	mace.connect("started_swinging", $timer2, "start")
	mace.connect("stopped_swinging", $timer2, "stop")
	if mace.is_swinging():
		$timer2.start()
	
	yield($timer2, "timeout")
	$good.visible = true
	yield(get_tree().create_timer(2.0),"timeout")
	$good.visible = false
	$good2.visible = true
	$time_label.visible = true
	mace.connect("started_swinging", $timer, "start")
	mace.connect("stopped_swinging", $timer, "stop")
	if mace.is_swinging():
		$timer.start()
	yield($timer, "timeout")
	$good.visible = false
	$good2.visible = false
	$time_label.visible = false
	$good3.visible = true
	$good3.max_lines_visible = 1
	yield(get_tree().create_timer(1.0),"timeout")
	$good3.max_lines_visible = 2
	yield(get_tree().create_timer(1.0),"timeout")
	$good3.max_lines_visible = 3
	yield(get_tree().create_timer(1.0),"timeout")
	$good3.max_lines_visible = 4
	
	
	HudMenu.visible = true
	for button in get_tree().get_nodes_in_group("button"):
		button.disabled = false
	
	yield(self, "sike")
	$sike.visible = true
	$good3.visible = false
	$sike.max_lines_visible = 1
	yield(get_tree().create_timer(1.0),"timeout")
	$sike.max_lines_visible = 2
	yield(get_tree().create_timer(2.0),"timeout")
	$sike.max_lines_visible = 3
	
	Pause.can_pause = true
func _physics_process(delta):
	var val
	if !$timer.is_stopped():
		val = ($timer.wait_time - $timer.time_left)
	else:
		val = 0.0
	$time_label.text = "%7.3f" % val

func _input(event):
	if event.is_action_pressed("pause"):
		emit_signal("sike")

func _exit_tree():
	Pause.can_pause = true
