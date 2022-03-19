extends Area2D
var why = false

func _on_areapapan_body_entered(body):
	if body.name == "character":
		why = true
		print("nyentuh")
#		if Input.is_action_just_pressed("ui_accept"):
#			Autoload.emit_signal("raden_intan2")
			
func _input(event):
		if event.is_action_pressed("ui_accept"):
			if why == true:
				if Global.dialogradenintan == true:
					get_tree().paused = true
					_muncul()
#	if event.is_action_pressed("ui_accept"):
#		_muncul()
func _muncul():
	Autoload.emit_signal("raden_intan2")


func _on_areapapan_body_exited(body):
	if body.name == "character":
		why = false
		emit_signal("hiden")
