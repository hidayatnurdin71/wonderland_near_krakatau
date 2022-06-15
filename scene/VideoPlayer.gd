extends VideoPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if not DataManager.data["Settings"].has("video"):
		self.play()
		Menusetting.stop_music()
	else: 
		get_tree().change_scene("res://scene/bagian/WORLD.tscn")
		Menusetting.play_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VideoPlayer_finished():
	Menusetting.play_music()
	DataManager.data["Settings"]["video"] = true
	DataManager.save_data()
	get_tree().change_scene("res://scene/bagian/WORLD.tscn")


func _on_TouchScreenButton_released():
	Menusetting.play_music()
	DataManager.data["Settings"]["video"] = true
	DataManager.save_data()
	get_tree().change_scene("res://scene/bagian/WORLD.tscn")
