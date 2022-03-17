extends Area2D

export(String, FILE,"*.tscn,*.scn") var target_scene
var tanya = false

func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if !target_scene: #is null
			print("no scene")
			return
		if get_overlapping_bodies().size()>0:

			next_level()
			
	Global.jejak = global_position

#	if event.is_action_pressed("attack"):
#		_on_masukrumah_area_entered(Area2D)
func next_level():
#	var ERR =  get_tree().change_scene(target_scene)
#
#	if ERR != OK:
#		print("not ok")
#	Global.door_name = name
	Autoload.emit_signal("pushdoor3")
	Autoload.emit_signal("pick_tool")
	Autoload.emit_signal("ganti_tool")
	
	

func _on_masukrumah_body_entered(body):
	if body.name == "character":
		show_tanya()

			
		
func show_tanya():
	if Global.map == "dalem_rumah3":
		$tanya.hide()
	if Global.map == "peta":
		$tanya.show()
	tanya = true


func hilang_tanya():
	tanya = false
	$tanya.hide()
func _on_TouchScreenButton_pressed():
	Autoload.emit_signal("ganti_tangan")


func _on_masukrumah_body_exited(body):
	if body.name == "character":
		hilang_tanya()
