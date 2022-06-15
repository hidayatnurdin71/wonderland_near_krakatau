extends Node2D

onready var character = $YSort/character
#var i = false
#onready var a = $YSort/Areacharcewe
func _ready():
#	if i == false:
#		remove_child(a)
#	if i == true:
#		add_child(a)
#	Autoload.connect("push_door", self,"on_push_door")
	Autoload.connect("muncul_panduan", self,"on_muncul_panduan")
	Autoload.connect("misi1selesai", self,"on_misi1selesai")
	Autoload.connect("reward1", self,"on_reward1")
	Autoload.connect("bayangan_papan",self,"on_bayangan_papan")
	Autoload.connect("muncul_sabit",self,"on_muncul_sabit")
	Autoload.connect("terima_buah",self,"on_terima_buah")
	Autoload.connect("bush_hilang", self,"on_bush_hilang")
	Autoload.connect("janganmuncul",self,"on_janganmuncul")
	if DataManager.data["Objects"].has("character_luar"):
		$YSort/character.global_position = DataManager.data["Objects"]["character_luar"]
	
#	if DataManager.data["Objects"].has("misipertama"):
#		$Area2D.queue_free()
	if DataManager.data["Objects"].has("awalgamesudah"):
		$awalmulaigame.queue_free()
#	print(DataManager.data)
	if DataManager.data["Objects"].has("misi1selesai"):
		$setelah_sabit_ketemu.queue_free()
		$YSort/sprite_cewe.queue_free()
	if DataManager.data["Objects"].has("dapetreward1"):
		$HUD/rewardcoin.queue_free()
	Autoload.connect("sudah_dapat_kamus",self,"on_sudah_dapat_kamus")
	Autoload.connect("anter_buah",self,"on_anter_buah")
	if DataManager.data["Objects"].has("areamuncul"):
		Global.areaada = true
	if DataManager.data["Objects"].has("misi_anter"):
		$YSort/Areacharcewe.queue_free()
		$YSort/char_ceweMisi.queue_free()
	if DataManager.data["Objects"].has("bushpindah"):
		var position_vector = Vector2(35,207)
		get_node("YSort/pohonpohon/Bush23").set_position(position_vector)
		get_node("YSort/pohonpohon/Bush24").set_position(position_vector)
func on_bayangan_papan():
	if Global.bayangan== true:
		$YSort/bayangan_papan.show()
	if Global.bayangan == false:
		$YSort/bayangan_papan.hide()
	
	
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
	if $AudioStreamPlayer.playing == false :
		$AudioStreamPlayer.play()
func on_janganmuncul():
	$Area2D.queue_free()
func on_sudah_dapat_kamus():
	pass
func _on_area_body_entered(body):
	pass # Replace with function body.

func on_anter_buah():
#	i = true
	$YSort/char_ceweMisi.show()
	$YSort/Areacharcewe.show()
	
func on_muncul_sabit():
	$Celurite.show()
	var position_vector = Vector2(35,207)
	get_node("Celurite").set_position(position_vector)
func on_bush_hilang():
		var position_vector = Vector2(35,207)
		get_node("YSort/pohonpohon/Bush23").set_position(position_vector)
		get_node("YSort/pohonpohon/Bush24").set_position(position_vector)
		DataManager.data["Objects"]["bushpindah"]= "selesai"
		DataManager.save_data()
