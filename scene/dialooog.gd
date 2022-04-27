extends Sprite
#var dialogPath = "user://dialog0.json"
var dialogPath = "user://dialogmulai.json"
#var dialogPath = "res://dialog/dialogmulai.json"
export(float) var textSpeed = 0.05
var json_data
var dialog
var _file = "dialogmulai.json"
var file
var phraseNum = 0
var finished = false
var new_data
func _ready():
	load_data()
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialog not found")
	nextPhrase()

func load_data():
	file = File.new()
	if not file.file_exists("user://" + _file):
#	if not file.file_exists("res://dialog/" + _file):
		save_data(default_data)
		return default_data
	else :
		file.open("user://" + _file,File.READ)

#		file.open("res://dialog/" + _file,File.READ)
		json_data = parse_json(_file.get_as_text())
		if json_data.size() > 0:
			return json_data
func save_data(new_data):
	file = File.new()
	file.open("user://" + _file,File.WRITE)
#	file.open("res://dialog/" + _file,File.WRITE)
	file.store_line(to_json(new_data))
	file.close()

func getDialog() -> Array:
	var f = File.new()
	f.open(dialogPath, File.READ)
	var json = f.get_as_text()
	var output = parse_json(json)
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []

func nextPhrase() -> void:
	if phraseNum >= len(dialog):
		queue_free()
		get_tree().paused = false
		return

	finished = false

	$Text.bbcode_text = dialog[phraseNum]["Text"]

	$Text.visible_characters = 0

	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1

		$Timer.start()
		yield($Timer, "timeout")

	finished = true
	phraseNum += 1
	return

var default_data=[

	{"Text":" Dimana ini...?"},
	{"Text":"A...Aku terdampar di pulau ini"},
	{"Text":"Pulau apa ini...?"},
	{"Text":"Ah disana ada seseorang!!"},
]
#=======================================================================
func _on_tombolx2_released():
	var selesai = finished
	if finished:
		nextPhrase()
	else:
		$Text.visible_characters = len($Text.text)
	DataManager.data["Objects"]["awalgamesudah"]=["sudah"]
	DataManager.save_data()
#=========================================================================pc
#extends Sprite
#
#export var dialogPath = "res://dialog/dialogmulai.json"
#export(float) var textSpeed = 0.05
#
#var dialog
#
#var phraseNum = 0
#var finished = false
#
#func _ready():
#	$Timer.wait_time = textSpeed
#	dialog = getDialog()
#	assert(dialog, "Dialog not found")
#	nextPhrase()
#
#func _process(_delta):
#	if Input.is_action_just_pressed("ui_accept"):
#		if finished:
#			nextPhrase()
#		else:
#			$Text.visible_characters = len($Text.text)
#
#func getDialog() -> Array:
#	var f = File.new()
#	assert(f.file_exists(dialogPath), "File path does not exist")
#
#	f.open(dialogPath, File.READ)
#	var json = f.get_as_text()
#
#	var output = parse_json(json)
#
#	if typeof(output) == TYPE_ARRAY:
#		return output
#	else:
#		return []
#
#func nextPhrase() -> void:
#	if phraseNum >= len(dialog):
#		queue_free()
#		return
#
#	finished = false
#
#	$Text.bbcode_text = dialog[phraseNum]["Text"]
#	$Text.visible_characters = 0
#
#	while $Text.visible_characters < len($Text.text):
#		$Text.visible_characters += 1
#
#		$Timer.start()
#		yield($Timer, "timeout")
#
#	finished = true
#	phraseNum += 1
#	return
#func _on_tombolx2_released():
#	var selesai = finished
#	if finished:
#		nextPhrase()
#	else:
#		$Text.visible_characters = len($Text.text)
#	DataManager.data["Objects"]["awalgamesudah"]=["sudah"]
#	DataManager.save_data()
