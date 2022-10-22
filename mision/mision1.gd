extends Area2D
var i= false
func _on_Areamisi_body_entered(body):
	i= true
	if body.name == "character":
		if i == true:
			Autoload.emit_signal("misi1")
			Autoload.emit_signal("muncul_sabit")
			queue_free()
			


func _on_Area2D_body_exited(body):
	i= false
	if body.name == "character":
		pass
