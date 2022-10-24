extends Node2D

onready var character = $YSort/character
#var i = false
#onready var a = $YSort/Areacharcewe
func _ready():
#	MisiManager.data["misi"]=["aaaaaaaaa"]
#	MisiManager.save_data()
#	get_node("susi").disable = true
#	get_node("bapak_mc").disable = true
#	get_node("characterNPC_afnan").disable = true
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
	Autoload.connect("terima_buah_selesai",self,"on_terima_buah_selesai")
	Autoload.connect("bush_hilang", self,"on_bush_hilang")
	Autoload.connect("janganmuncul",self,"on_janganmuncul")
	Autoload.connect("muncul_buah_pisang",self,"on_muncul_misi_pisang")
	Autoload.connect("lineout1",self,"on_lineout1")
	Autoload.connect("lineout2",self,"on_lineout2")
	Autoload.connect("cari_pisang",self,"on_cari_pisang")
	Autoload.connect("misipisang_ditemukan1",self,"on_misipisang_ditemukan1")
	Autoload.connect("misipisang_ditemukan2",self,"on_misipisang_ditemukan2")
	Autoload.connect("bapakMC_muncul",self,"on_bapak_muncul")
	Autoload.connect("ending",self,"on_ending")
	if DataManager.data["Objects"].has("buah_diterima"):
		Global.misi_anter_selesai = true
		$YSort/npc_3.queue_free()
		$YSort/characterNPC_afnan.show()
		Global.npc_afnan = true
	if Global.misi_temukan_pisang == true:
		$misi_caripisang.queue_free()
	if Global.misi_temukan_pisang2 == true:
		$misi_caripisang2.queue_free()
	if DataManager.data["Objects"].has("character_luar"):
		$YSort/character.global_position = DataManager.data["Objects"]["character_luar"]
	if DataManager.data["Objects"].has("anterpisang"):
		Global.buah = true
	if DataManager.data["Objects"].has("pisang_ditemukan"):
		$misi_caripisang.queue_free()
	if DataManager.data["Objects"].has("pisang_ditemukan2"):
		$misi_caripisang2.queue_free()
		$YSort/susi.show()
#	if DataManager.data["Objects"].has("misipertama"):
#		$Area2D.queue_free()
	if DataManager.data["Objects"].has("awalgamesudah"):
		$awalmulaigame.queue_free()
#	print(DataManager.data)
	if DataManager.data["Objects"].has("misi1selesai"):
		$setelah_sabit_ketemu.queue_free()
		$YSort/sprite_cewe.queue_free()
		$Area2D.queue_free()
		$HUD/rewardcoin.queue_free()
	if DataManager.data["Objects"].has("dapetreward1"):
		$Area2D.queue_free()
	if DataManager.data["Objects"].has("dapetreward2"):
		$HUD/rewardcoin2.queue_free()
	Autoload.connect("sudah_dapat_kamus",self,"on_sudah_dapat_kamus")
	Autoload.connect("anter_buah",self,"on_anter_buah")
	if DataManager.data["Objects"].has("areamuncul"):
		Global.areaada = true
	if DataManager.data["Objects"].has("misi_anter"):
		Global.misi_anter_selesai = false
		$YSort/Areacharcewe.queue_free()
		$YSort/char_ceweMisi.queue_free()
	if DataManager.data["Objects"].has("bushpindah"):
#		Global.npc_afnan = false
		var position_vector = Vector2(35,207)
		get_node("YSort/pohonpohon/Bush23").set_position(position_vector)
		get_node("YSort/pohonpohon/Bush24").set_position(position_vector)
	if DataManager.data["Objects"].has("misi4_muncul"):
		Global.npc_afnan = false
	if DataManager.data["Objects"].has("dialog_susi_memberitahu"):
		Global.misi_terakhir = true
#		Autoload.emit_signal("bpk_muncul")
		$YSort/bapak_mc.show()
	if DataManager.data["Objects"].has("misi_cari_pisang"):
		$misi_caripisang.show()
		$misi_caripisang2.show()
	if DataManager.data["Objects"].has("pisang1_selesai"):
		$misi_caripisang.queue_free()
	if DataManager.data["Objects"].has("pisang2_selesai"):
#		Global.misi_ketiga = true
#		Global.npc_afnan = false
		Global.susii = true
		Autoload.emit_signal("susi_muncul")
		$misi_caripisang2.queue_free()
		$YSort/susi.show()
		Global.npc_afnan = false
	if DataManager.data["Objects"].has("misi_pertama_sudah_muncul"):
		$Area2D.queue_free()
	if DataManager.data["Objects"].has("celurit_muncul"):
		if DataManager.data["Objects"].has("misi1selesai"):
			$Celurite.queue_free()
		else:
			$Celurite.show()
	if DataManager.data["Objects"].has("ending"):
		$YSort/bapak_mc.queue_free()
	if DataManager.data["Objects"].has("misi_keempat_terkunci"):
		Global.misi_keempat = false
		if DataManager.data["Objects"].has("hapus_buku"):
			Global.misi_keempat = true
	if DataManager.data["Objects"].has("misi_ketiga_terkunci"):
		Global.misi_ketiga = false
		if DataManager.data["Objects"].has("pisang2_selesai"):
			Global.misi_ketiga = true
			Global.npc_afnan = false
	if DataManager.data["Objects"].has("misi_terakhir_muncul"):
		Global.misi_terakhir = true
	
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
	DataManager.data["Objects"]["celurit_muncul"]= "selesai"
	DataManager.save_data()
func on_bush_hilang():
		var position_vector = Vector2(35,207)
		get_node("YSort/pohonpohon/Bush23").set_position(position_vector)
		get_node("YSort/pohonpohon/Bush24").set_position(position_vector)
		DataManager.data["Objects"]["bushpindah"]= "selesai"
		DataManager.save_data()
#func on_muncul_misi_pisang():
#	$misi_caripisang.show()
func on_terima_buah_selesai():
#	get_node("characterNPC_afnan").disable = false
	Global.misi_anter_selesai = true
	$YSort/Areanpc3.queue_free()
	$YSort/char_ceweMisi.queue_free()
	$YSort/characterNPC_afnan.show()
	Global.npc_afnan = true
	if Global.misi_anter_selesai == true:
		$YSort/npc_3.queue_free()
		DataManager.data["Objects"]["buah_diterima"]=["sudah"]
		DataManager.save_data()
func on_lineout1():
	$YSort/npc_3/lineout.show()
func on_lineout2():
	$YSort/npc_3/lineout.hide()
func on_cari_pisang():
	Global.misi4muncul = true
	$misi_caripisang.show()
	$misi_caripisang2.show()
	Global.npc_afnan = false
#	Autoload.emit_signal()
	DataManager.data["Objects"]["misi4_muncul"]=["sudah"]
	DataManager.save_data()
func on_misipisang_ditemukan1():
	$misi_caripisang.queue_free()
	DataManager.data["Objects"]["pisang1_selesai"]=["sudah"]
	DataManager.save_data()
func on_misipisang_ditemukan2():
#	get_node("susi").disable = false
	$YSort/susi.show()
	$misi_caripisang2.queue_free()
	$HUD/rewardcoin2.show()
	Global.misi_ketiga = true
	Global.susii = true
	Autoload.emit_signal("susi_muncul")
	DataManager.data["Objects"]["pisang2_selesai"]=["sudah"]
	DataManager.save_data()
func on_bapak_muncul():
#	Autoload.emit_signal("bapakMC_muncul")
#	get_node("bapak_mc").disable = false
	$YSort/bapak_mc.show()
func on_ending():
	$YSort/bapak_mc.queue_free()
	DataManager.data["Objects"]["ending"]=["sudah"]
	DataManager.save_data()
