extends Label

func _ready():
	if DataManager.data["Settings"].has(name):
		var jumlah = DataManager.data["Settings"][name]
		Global.coins = jumlah
func _process(delta):
	text = String(Global.coins)
	DataManager.data["Settings"][name]= Global.coins
	DataManager.save_data()
