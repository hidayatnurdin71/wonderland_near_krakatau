extends Area2D
var why = false
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if why == true:
			if Global.dialogbpk == true:
				Global.muncull = true
				Autoload.emit_signal("analog")
				get_tree().paused = true
				$hud/dialogchar3.show()
				Global.areaada = true
				DataManager.data["Objects"]["areamuncul"]=["sudah"]
				DataManager.save_data()
				Autoload.emit_signal("anter_buah")
			if Global.dialogbpk == false:
				$hud/dialogHALO.show()
#				$hud/dialogHALO/Timer.start()
func _on_character3_body_entered(body):
	if body.name == "character":
		why = true
		print("apa")
		$lineoutbpk.show()
		$tandaanya.show()



func _on_character3_body_exited(body):
	if body.name == "character":
		why = false
		print("apa")
		$lineoutbpk.hide()
		$tandaanya.hide()

