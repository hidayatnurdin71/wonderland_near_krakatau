extends Node2D

func _ready():
	if DataManager.data["Settings"].has("dikurang1"):
		$radenintan2.show()
		$ke_detail.show()
		$locked.queue_free()

func _on_exit_released():
	get_tree().change_scene("res://scene/bagian/WORLD.tscn")

func _on_ya_pressed():
	var harga = 3
	Global.coindikurang = harga
	var jumlahkini = 0
	
	if Global.coins < 3:
		$yakin.hide()
		$uangkurang.show()
	if Global.coins >= 3:
		jumlahkini = Global.coins - harga
		var setelah_dikurangi = jumlahkini
		DataManager.data["Settings"]["dikurang1"]= Global.coindikurang
		DataManager.save_data()
		$yakin.hide()
		$radenintan2.show()
		$ke_detail.show()

func _on_tidak_pressed():
	$yakin.hide()
	$locked.show()

func _on_tombol1_released():
	$yakin.show()
	
	$locked.hide()

func _on_uangkurang_released():
	$uangkurang.hide()
	$locked.show()


func _on_ke_detail_pressed():
	get_tree().change_scene("res://scene/menuedukasi.tscn")
