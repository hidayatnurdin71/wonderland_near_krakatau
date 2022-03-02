extends CanvasLayer

func _on_sentuh_pressed():
	$rewardcoin.queue_free()
	DataManager.data["Objects"]["dapetreward1"]= "selesai"
	DataManager.save_data()
