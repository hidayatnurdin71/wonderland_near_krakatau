extends Area2D
var why = false
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if why == true:
			if Global.dialogbpk == true:
				get_tree().paused = true
				$hud/dialogchar3.show()

func _on_character3_body_entered(body):
	if body.name == "character":
		why = true
		print("apa")
		$tandaanya.show()



func _on_character3_body_exited(body):
	if body.name == "character":
		why = false
		print("apa")
		$tandaanya.hide()

