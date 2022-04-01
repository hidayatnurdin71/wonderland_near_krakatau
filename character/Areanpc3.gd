extends Area2D


func _ready():
	pass
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if Global.i == true:
			Autoload.emit_signal("terima_buah")
func _on_Areanpc3_body_entered(body):
	if body.name == "character":
		Global.i= true

func _on_Areanpc3_body_exited(body):
	if body.name == "character":
		Global.i= false
