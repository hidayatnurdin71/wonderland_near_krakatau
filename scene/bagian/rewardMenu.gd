extends Node2D
var jumlah = null
var kartu = null
func _ready():
	if DataManager.data["Settings"].has("dikurang1"):
#		$radenintan2.show()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu1/harga.hide()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu1/TextureRect.show()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu1/rumah_1.hide()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu1/ke_detail.show()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu1/tombol1.queue_free()
	if DataManager.data["Settings"].has("dikurang2"):
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu2/harga.hide()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu2/lamban_pesagi.show()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu2/rumah_2.hide()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu2/ke_detail2.show()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu2/tombol2.queue_free()
	if DataManager.data["Settings"].has("dikurang3"):
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu3/harga.hide()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu3/nuwo_balak.show()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu3/rumah_3.hide()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu3/ke_detail3.show()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu3/tombol3.queue_free()
	if DataManager.data["Settings"].has("dikurang4"):
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu4/harga.hide()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu4/nuwo_lunik.show()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu4/rumah_4.hide()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu4/ke_detail4.show()
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu4/tombol4.queue_free()
func _on_exit_released():
	get_tree().change_scene("res://scene/bagian/WORLD.tscn")

func _on_ya_pressed():
	var harga = jumlah
	
	var jumlahkini = 0
	if kartu == "a":
		if Global.coins < 5:
			$yakin.hide()
			$uangkurang.show()
#			Global.coindikurang = 0
		if Global.coins >= 5:
#			Global.coindikurang = 5
			Global.coins = Global.coins - 5
##			jumlahkini = Global.coins - 5
#			var setelah_dikurangi = jumlahkini
			DataManager.data["Settings"]["dikurang1"]= ("sudah")
			DataManager.save_data()
			$yakin.hide()
#			$radenintan2.show()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu1/harga.hide()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu1/rumah_1.hide()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu1/TextureRect.show()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu1/ke_detail.show()
			get_tree().paused = false
	if kartu == "b":
		if Global.coins < 5:
			$yakin.hide()
			$uangkurang.show()
#			Global.coindikurang = 0
		if Global.coins >= 5:
			Global.coins = Global.coins - 5
#			Global.coindikurang = 5
#			jumlahkini = Global.coins - 5
#			var setelah_dikurangi = jumlahkini
			DataManager.data["Settings"]["dikurang2"]= Global.coindikurang
			DataManager.save_data()
			$yakin.hide()
#			$radenintan2.show()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu2/harga.hide()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu2/rumah_2.hide()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu2/lamban_pesagi.show()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu2/ke_detail2.show()
			get_tree().paused = false
	if kartu == "c":
		if Global.coins <5:
			$yakin.hide()
			$uangkurang.show()
#			Global.coindikurang = 0
		if Global.coins >= 5:
			Global.coins = Global.coins - 5
#			Global.coindikurang = 5
#			jumlahkini = Global.coins - 5
#			var setelah_dikurangi = jumlahkini
			DataManager.data["Settings"]["dikurang3"]= Global.coindikurang
			DataManager.save_data()
			$yakin.hide()
#			$radenintan2.show()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu3/harga.hide()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu3/rumah_3.hide()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu3/nuwo_balak.show()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu3/ke_detail3.show()
			get_tree().paused = false
	if kartu == "d":
		if Global.coins < 5:
			$yakin.hide()
			$uangkurang.show()
#			Global.coindikurang = 0
		if Global.coins >= 5:
			Global.coins = Global.coins - 5
#			Global.coindikurang = 5
#			jumlahkini = Global.coins - 5
#			var setelah_dikurangi = jumlahkini
			DataManager.data["Settings"]["dikurang4"]= Global.coindikurang
			DataManager.save_data()
			$yakin.hide()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu4/harga.hide()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu4/rumah_4.hide()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu4/nuwo_lunik.show()
			$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu4/ke_detail4.show()
			get_tree().paused = false
func _on_tidak_pressed():
	$yakin.hide()
	get_tree().paused = false
	if kartu == "a":
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu1/tombol1.show()
	if kartu == "b":
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu2/tombol2.show()
	if kartu == "c":
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu3/tombol3.show()
	if kartu == "d":
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu4/tombol4.show()
#	$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu1/tombol1.show()

func _on_tombol1_released():
	kartu = "a"
	jumlah = 5
	$yakin.show()
	get_tree().paused = true
	print(Global.coins)
	print(kartu)
	$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu1/tombol1.hide()

func _on_uangkurang_released():
	$uangkurang.hide()
	get_tree().paused = false
	if kartu == "a":
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu1/tombol1.show()
	if kartu == "b":
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu2/tombol2.show()
	if kartu == "c":
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu3/tombol3.show()
	if kartu == "d":
		$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu4/tombol4.show()
func _on_ke_detail_released():
#	get_tree().change_scene("res://scene/menuedukasi.tscn")
	get_tree().change_scene("res://rumah adat.tscn")


func _on_tombol2_released():
	kartu = "b"
	jumlah = 5
	$yakin.show()
	get_tree().paused = true
	$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu2/tombol2.hide()
	print(kartu)
	print(Global.coins)
func _on_ke_detail2_released():
	get_tree().change_scene("res://rumah_adat2.tscn")


func _on_ke_detail3_released():
	get_tree().change_scene("res://rumah_adat3.tscn")


func _on_ke_detail4_released():
	get_tree().change_scene("res://rumah_adat4.tscn")


func _on_tombol3_released():
	kartu = "c"
	jumlah = 5
	$yakin.show()
	get_tree().paused = true
	$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu3/tombol3.hide()
	print(kartu)
	print(Global.coins)
func _on_tombol4_released():
	kartu = "d"
	jumlah = 5
	$yakin.show()
	get_tree().paused = true
	$ScrollContainer/CenterContainer/MarginContainer/HBoxContainer/CardMenu4/tombol4.hide()
	print(kartu)
	print(Global.coins)
