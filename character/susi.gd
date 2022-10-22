extends KinematicBody2D
var diarea = null
var susi = true
func _ready():
	Autoload.connect("susi_false",self,"on_susi_false")
	if DataManager.data["Objects"].has("dialog_susi_memberitahu"):
		susi = false

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if diarea == true:
			if susi == true:
#				Autoload.emit_signal("analog")
				get_tree().paused = true
				$hud/dialog_NPC_susi.show()
#				Autoload.emit_signal("bapak_muncul_ending")
			if susi == false:
				get_tree().paused = true
				$hud/dialog_halo_susi.show()

func _on_Area2D_body_entered(body):
	if body.name == "character":
		diarea = true
		$Sprite2.show()
func _on_Area2D_body_exited(body):
	if body.name == "character":
		diarea = false
		$Sprite2.hide()
func on_susi_false():
	susi = false
