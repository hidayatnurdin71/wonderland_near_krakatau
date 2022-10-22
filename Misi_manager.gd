extends Node
const file_name =  "Misi_manager.json"
var data = ""

func _ready():
	load_data()
func load_data():
	var file = File.new()
	if file.file_exists("user://" + file_name):
		file.open("user://" + file_name, File.READ)
		data = file.get_var()
		file.close()
	else :
		data = {
		"misi": "misi11111111",
		"ceklis":"sudah"
}

func save_data():
	var file = File.new()
	file.open("user://" + file_name, File.WRITE)
	file.store_var(data)
	file.close()
