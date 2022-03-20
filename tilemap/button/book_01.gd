extends StaticBody2D
var i
func _ready():
	pass
#	Autoload.connect("gariskuning",self,"on_gariskuning")
#	if Global.badan == true:
#		i = show()
#	else:
#		i = hide()
#func on_gariskuning():
#	$bayangan.i
	
func _input(event):
	if Global.badan == true:
		if event.is_action_pressed("ui_accept"):
#			$buku.queue_free()
#			$Area2D.queue_free()
			Autoload.emit_signal("buku_diambil")
			Global.dialogradenintan = false
			Global.munculterjemahan = true
			DataManager.data["Objects"]["munculterjemahan"]=["selesai"]
#			Global.munculterjemahan = DataManager.data["Objects"]["munculterjemahan"]
			print (Global.munculterjemahan)
			DataManager.save_data()
			DataManager.data["Objects"]["buku"]=["sudah_diambil"]
			DataManager.save_data()
func _on_Area2D_body_entered(body):
	if body.name == "character":
		Global.badan = true
		$bayangan.show()


func _on_Area2D_body_exited(body):
	if body.name == "character":
		Global.badan = false
		$bayangan.hide()
