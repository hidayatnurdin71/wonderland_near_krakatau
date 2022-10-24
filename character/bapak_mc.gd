extends KinematicBody2D

var diarea = null
func _ready():
#	on_bpk_muncul()
	if Global.misi_terakhir == false:
		get_node("Area2D/CollisionShape2D").disabled = true
		get_node("CollisionShape2D").disabled = true
	if Global.misi_terakhir == true:
		get_node("Area2D/CollisionShape2D").disabled = false
		get_node("CollisionShape2D").disabled = false
	Autoload.connect("bpk_muncul",self,"on_bpk_muncul")
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
func on_bpk_muncul():
	Global.misi_terakhir = true
	if Global.misi_terakhir == true:
		get_node("Area2D/CollisionShape2D").disabled = false
		get_node("CollisionShape2D").disabled = false
	DataManager.data["Objects"]["misi_terakhir_muncul"]=["sudah"]
	DataManager.save_data()
