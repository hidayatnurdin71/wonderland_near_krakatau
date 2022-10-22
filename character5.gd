extends KinematicBody2D
var why = false;
func _ready():
	
	pass # Replace with function body.
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if why == true:
			if Global.npc_afnan == true:
#				Global.muncul_dialog = true
				Autoload.emit_signal("analog")
				get_tree().paused = true
				$hud/dialog_NPC.show()
#				$dialog_NPC/Timer.start()
#				Global.areaada2 = true
				Autoload.emit_signal("cari_pisang")
			if Global.npc_afnan == false:
				get_tree().paused = true
				$hud/dialog_halo.show()
#				$dialog_halo/Timer.start()
#				$hud/dialogHALO/Timer.start()
func _on_Area2D_body_entered(body):
	if body.name == "character":
		why = true
		$lineout.show()
func _on_Area2D_body_exited(body):
	if body.name == "character":
		why = false
		$lineout.hide()
