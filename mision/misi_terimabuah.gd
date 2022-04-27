extends Sprite
var dialogPath = "user://terimabuah.json"
export(float) var textSpeed = 0.05
var dialog
var _file ="terimabuah.json"
var file
var phraseNum = 0
var finished = false
var json_data
func _ready():
	load_data()
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialog not found")
	nextPhrase()
 
#func _process(_delta):
#	$tombolx2.visible = finished
#	if Input.is_action_just_pressed("ui_accept"):
#		if finished:
#			nextPhrase()
#		else:
#			$Text.visible_characters = len($Text.text)
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
	{"image":"charatercowo" ,"Text":"hai..."},
	{"image":"npc4" ,"Text":"halo.."},
	{"image":"charatercowo" ,"Text":"apakah kamu yang bernama AFNAN?"},
	{"image":"npc4" ,"Text":"iya benar.."},
	{"image":"charatercowo" ,"Text":"ah perkenalkan namaku Rudi"},
	{"image":"npc4" ,"Text":"ada perlu apa rudi?"},
	{"image":"charatercowo" ,"Text":"ini aku mengantarkan buah untuk mu.."},
	{"image":"charatercowo" ,"Text":"susi tadi menitipkannya padaku karena dia sedang terburu-buru"},
	{"image":"npc4" ,"Text":"ah dari susi.."},
	{"image":"npc4" ,"Text":"terimakasih banyak rudi"},
	{"image":"charatercowo" ,"Text":"sama-sama afnan"},
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
		queue_free()
		get_tree().paused = false
#		Autoload.emit_signal("reward1")
#		Global.coins = Global.reward +Global.coins
		Global.misi_anter_selesai = true
		DataManager.data["Objects"]["buah_diterima"]=["sudah"]
		DataManager.save_data()
		return
	finished = false
#	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Text.bbcode_text = dialog[phraseNum]["Text"]
	$Text.visible_characters = 0
	
	var f = File.new()
	var img =dialog[phraseNum]["image"] + ".png"
	if f.file_exists(img):
		$character.texture = load("res//:"+img)
	else: 
		$character.texture = null
	
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

