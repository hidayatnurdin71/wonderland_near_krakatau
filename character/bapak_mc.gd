extends KinematicBody2D

var diarea = null
func _ready():
	Autoload.connect("ending",self,"on_ending")
	pass # Replace with function body.
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if diarea == true:
#			Autoload.emit_signal("analog")
			get_tree().paused = true
			$hud/dialog_NPC_bapak.show()
#			Autoload.emit_signal("bapak_muncul_ending")
		if diarea == false:
			pass
func _on_Area2D_body_entered(body):
	if body.name == "character":
		diarea = true
		$Sprite2.show()

func _on_Area2D_body_exited(body):
	if body.name == "character":
		diarea = false
		$Sprite2.hide()
func on_ending():
	
	get_tree().change_scene("res://scene/credit.tscn")
