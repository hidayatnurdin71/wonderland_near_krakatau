extends Area2D


func _ready():
	if DataManager.data["Objects"].has("sudahterimabuah"):
		Global.misi_ketiga = true
		Global.buah = false
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if Global.i == true:
			if Global.buah == true :
				Autoload.emit_signal("terima_buah")
				Global.misi_ketiga = true
				Global.misi_keempat = true
				DataManager.data["Objects"]["sudahterimabuah"]= "selesai"
				DataManager.save_data()
			if Global.buah == false :
				pass
func _on_Areanpc3_body_entered(body):
	if body.name == "character":
		Global.i= true
		Autoload.emit_signal("lineout1")
func _on_Areanpc3_body_exited(body):
	if body.name == "character":
		Global.i= false
		Autoload.emit_signal("lineout2")
