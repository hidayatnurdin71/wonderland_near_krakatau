extends Node2D

onready var character = $YSort/character
onready var pisang = $YSort/character/pisang
onready var misi_cari_pisang = $YSort/character/CanvasLayer/misitemukan_pisang
func _ready():
	if DataManager.data["Objects"].has("pisang1_selesai"):
		misi_cari_pisang.queue_free()
	if DataManager.data["Objects"].has("buah_diterima"):
		pisang.queue_free()
	if DataManager.data["Objects"].has("AREAUDAHDI_INJEK"):
		$book_01.show()
	if DataManager.data["Objects"].has("character_perpus"):
		character.global_position = DataManager.data["Objects"]["character_perpus"]
	if DataManager.data["Objects"].has("buku"):
		$book_01.queue_free()
	if DataManager.data["Objects"].has("buku_muncul"):
		on_muncul_buku()
	if DataManager.data["Objects"].has("hapus_buku"):
		Global.misi_keempat = true
		$book_01.queue_free()
	if DataManager.data["Objects"].has("pisang1_selesai"):
		$YSort/character/CanvasLayer/bar_misi/cari_pisang.queue_free()
	Autoload.connect("muncul_buku",self,"on_muncul_buku")
	Autoload.connect("buku_diambil",self,"on_buku_diambil")
	
#	print(Global.door_name)
#	print(Global.ceeluritdipake)
#	print(Global.celuritkondisi)
#	if Global.door_name:
#			var door_node = find_node(Global.door_name)
#			if door_node:
#				$YSort/character.global_position = door_node.global_position
				
func on_muncul_buku():
	$book_01.show()
	var position_vector = Vector2(88,174)
	get_node("book_01").set_position(position_vector)
	DataManager.data["Objects"]["buku_muncul"] = "selesai"
	DataManager.save_data()
func on_buku_diambil():
	$CanvasLayer/ColorRect.show()
	$CanvasLayer/animation_book.show()
	$CanvasLayer/tombolx2.show()
	$CanvasLayer/oke.show()
	$book_01.queue_free()
	Autoload.emit_signal("misi2")
	Global.misi_keempat = true
	DataManager.data["Objects"]["hapus_buku"] = "selesai"
	DataManager.save_data()
func _process(delta):
	DataManager.data["Objects"]["character_perpus"] = character.global_position
	DataManager.save_data()
func _on_tombolx2_released():
	$CanvasLayer.queue_free()
	Autoload.emit_signal("di_oke")
