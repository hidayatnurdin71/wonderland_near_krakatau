extends Area2D
var why = false
func _ready():
	if DataManager.data["Objects"].has("munculterjemahan"):
		Global.munculterjemahan= true
	if DataManager.data["Objects"].has("buku"):
		Global.dialogradenintan = false
func _on_areapapan_body_entered(body):
	if body.name == "character":
		why = true
		Global.bayangan = true
		print("nyentuh")
		Autoload.emit_signal("bayangan_papan")
#		if Input.is_action_just_pressed("ui_accept"):
#			Autoload.emit_signal("raden_intan2")
func _input(event):
		if event.is_action_pressed("ui_accept"):
			if why == true:
				if Global.dialogradenintan == true:
#					get_tree().paused = true
					if Global.munculterjemahan == false:
						_muncul()
#					_muncul()
						DataManager.data["Objects"]["AREAUDAHDI_INJEK"]= "selesai"
						DataManager.save_data()
						Autoload.emit_signal("muncul_buku")
					if Global.munculterjemahan == true:
						muncul2()
				if Global.dialogradenintan == false:
					if Global.munculterjemahan == false:
						_muncul()
					if Global.munculterjemahan == true:
						muncul2()
#	if event.is_action_pressed("ui_accept"):
#		_muncul()

func muncul2():
	Autoload.emit_signal("raden_intan3")
func _muncul():
	Autoload.emit_signal("raden_intan2")
	


func _on_areapapan_body_exited(body):
	if body.name == "character":
		why = false
		Global.bayangan = false
#		emit_signal("hiden")
		Autoload.emit_signal("bayangan_papan")
