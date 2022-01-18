extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if DataManager.data["Settings"].has("jumlahkoin"):
		var jumlah = DataManager.data["Settings"]["jumlahkoin"]
		Global.coins = jumlah
#	if DataManager.data["Settings"].has("dikurang1"):
#		Global.coins = Global.coins - Global.coindikurang
func _process(delta):
	text = String(Global.coins)
	if DataManager.data["Settings"].has("dikurang1"):
		text = String(Global.coins-Global.coindikurang)
		DataManager.data["Settings"]["jumlahkoin"]= Global.coins
		DataManager.save_data()
