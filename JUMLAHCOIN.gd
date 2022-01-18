extends Label

func _ready():
	if DataManager.data["Settings"].has("jumlahkoin"):
		var jumlah = DataManager.data["Settings"]["jumlahkoin"]
		Global.coins = jumlah
	if DataManager.data["Settings"].has("dikurang1"):
		Global.coins = Global.coins - Global.coindikurang
		Global.coindikurang = 0

		
func _process(delta):
	text = String(Global.coins)
	DataManager.data["Settings"]["jumlahkoin"]= Global.coins
	DataManager.save_data()
