extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if DataManager.data["Settings"].has("dikurang1"):
		$radenintan2.show()
		$tombol1.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_exit_released():
	get_tree().change_scene("res://scene/bagian/WORLD.tscn")


func _on_tombol1_pressed():
	$yakin.show()
	
	$tombol1.hide()


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
	


func _on_uangkurang_pressed():
	$uangkurang.hide()
	$tombol1.show()
