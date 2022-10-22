extends Area2D
var i = false
func _ready():
	if DataManager.data["Objects"].has("anterpisang"):
		Global.buah = true

func _on_Areacharcewe_body_entered(body):
	if body.name == "character":
		if Global.areaada == true:
			i = true
			if i == true:
				Autoload.emit_signal("misi_anter")
				Global.buah = true
				Autoload.emit_signal("bush_hilang")
				queue_free()
				DataManager.data["Objects"]["anterpisang"]= "selesai"
				DataManager.save_data()


func _on_Areacharcewe_body_exited(body):
	if body.name == "character":
		if Global.areaada == true:
			i = false
