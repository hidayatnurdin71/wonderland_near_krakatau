extends Sprite
var dialogPath = "user://halo_susi.json"
export(float) var textSpeed = 0.05
var json_data
var dialog
var file
var _file = "halo_susi.json"
var phraseNum = 0
var finished = false
 
func _ready():
	load_data()
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialog not found")
	nextPhrase()

func load_data():
	file = File.new()
	if not file.file_exists("user://" + _file):
		save_data(default_data)
		return default_data
	else :
		file.open("user://" + _file,File.READ)
		json_data = parse_json(_file.get_as_text())
		if json_data.size() > 0:
			return json_data
func save_data(new_data):
	file = File.new()
	file.open("user://" + _file,File.WRITE)
	file.store_line(to_json(new_data))
	file.close()
var default_data=[
	{"Text":"hallo Rudi.. ada yang bisa kubantu?"},
]
#=============================================================================
func getDialog() -> Array:
	var f = File.new()
	assert(f.file_exists(dialogPath), "File path does not exist")
	
	f.open(dialogPath, File.READ)
	var json = f.get_as_text()
	var output = parse_json(json)
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []
 
func nextPhrase() -> void:
	if phraseNum >= len(dialog):
		hide()
		get_tree().paused = false
#		DataManager.data["Objects"]["dialog_halo"]=["sudah"]
#		DataManager.save_data()
		return
	finished = false
#	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	$Text.visible_characters = 0
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		$Timer.start()
		yield($Timer, "timeout")
	finished = true
	phraseNum += 1
	return
func _on_tombol2_pressed():
	var selesai = finished
	if finished:
		nextPhrase()
	else:
		$Text.visible_characters = len($Text.text)
