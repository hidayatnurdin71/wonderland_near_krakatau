extends CanvasLayer

func _ready():
	pass # Replace with function body.

func _on_tomboltutupmisi_released():
#	if bar_misi == true:
	$bar_misi.hide()
	$lihat_misi/notif.hide()


func _on_tekan_released():
	$bar_misi.show()

func _on_setting_pressed():
	get_tree().change_scene("res://rewardMenu.tscn")

func _on_tombolx2_released():
	$raden_intan3.hide()
