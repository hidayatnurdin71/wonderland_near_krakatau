extends CanvasLayer

var coins = 0

func _on_COIN_coin_collected():
	coins = coins + 1
#	var JUMLAHCOIN ="coin :"+ String(coins)
	Global.coins += 1
	


func _on_sentuh_pressed():
	$rewardcoin.queue_free()
	DataManager.data["Objects"]["dapetreward1"]= "selesai"
	DataManager.save_data()
