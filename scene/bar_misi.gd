extends Sprite
var dialogPath = "user://Misi_manager.json"
export(float) var textSpeed = 0.05
var dialog
var _file ="Misi_manager.json"
var file
var phraseNum = 0
var finished = false
var json_data
func _ready():
	load_data()
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialog not found")
	$Text.visible_characters = len($Text.text)
	nextPhrase()
#=============================================================================
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
	{"misi":"temukan celurit"},
	{"misi":"temukan celurit"},
	{"misi":"temukan celurit"},
	{"misi":"temukan celurit"},
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
#		queue_free()
#		get_tree().paused = false
#		Global.misi_temukan_pisang = true
#		Autoload.emit_signal("misipisang_ditemukan2")
#		MisiManager.data["misi"]["pisang_ditemukan2"]=["sudah"]
#		MisiManager.save_data()
		return
	finished = false
#	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["misi"]
	$Text.visible_characters = 0
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		$Timer.start()
		yield($Timer, "timeout")
	finished = true
	phraseNum += 1
	return

func _on_tombolnext_released():
	var selesai = finished
	if finished:
		nextPhrase()
	else:
		$Text.visible_characters = len($Text.text)
