extends Node2D

onready var character = $YSort/character

func _ready():
#	Autoload.connect("push_door", self,"on_push_door")
	Autoload.connect("muncul_panduan", self,"on_muncul_panduan")
	Autoload.connect("misi1selesai", self,"on_misi1selesai")
	Autoload.connect("reward1", self,"on_reward1")
	if DataManager.data["Objects"].has("character_luar"):
		$YSort/character.global_position = DataManager.data["Objects"]["character_luar"]
	
	if DataManager.data["Objects"].has("misipertama"):
		$Area2D.queue_free()
	if DataManager.data["Objects"].has("awalgamesudah"):
		$awalmulaigame.queue_free()
#	print(DataManager.data)
	if DataManager.data["Objects"].has("misi1selesai"):
		$setelah_sabit_ketemu.queue_free()
		$YSort/sprite_cewe.queue_free()
	if DataManager.data["Objects"].has("dapetreward1"):
		$HUD/rewardcoin.queue_free()
	Autoload.connect("sudah_dapat_kamus",self,"on_sudah_dapat_kamus")
	
#func on_push_door():
#	if Global.map == "dalem_rumah":
#		$pintu1.hide()
#	if Global.map == "peta":
#		$pintu1.show()
func on_misi1selesai():
	$YSort/sprite_cewe.hide()
	DataManager.data["Objects"]["misi1selesai"]= "selesai"
	DataManager.save_data()
func on_reward1():
	$HUD/rewardcoin.show()
func on_muncul_panduan():
	get_tree().paused = true
	$HUD/panduan_penggunaan.show()
func _process(delta):
	DataManager.data["Objects"]["character_luar"]= character.global_position
	DataManager.save_data()

func on_sudah_dapat_kamus():
	pass
func _on_area_body_entered(body):
	pass # Replace with function body.
