extends Area2D
var i = false
func _ready():
	pass # Replace with function body.

func _on_Areacharcewe_body_entered(body):
	if body.name == "character":
		if Global.areaada == true:
			i = true
			if i == true:
				Autoload.emit_signal("misi_anter")
				Autoload.emit_signal("bush_hilang")
				queue_free()


func _on_Areacharcewe_body_exited(body):
	if body.name == "character":
		if Global.areaada == true:
			i = false
