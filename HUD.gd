extends CanvasLayer
func _ready():
	Autoload.connect("terima_buah",self,"on_terima_buah")
func _on_sentuh_pressed():
	$rewardcoin.queue_free()
	DataManager.data["Objects"]["dapetreward1"]= "selesai"
	DataManager.save_data()
func on_terima_buah():
	pass
	
