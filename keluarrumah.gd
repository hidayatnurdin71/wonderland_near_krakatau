extends Area2D
export(String, FILE,"*.tscn,*.scn") var target_scene
func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if !target_scene: #is null
			print("no scene")
			return
		if get_overlapping_bodies().size()>0:
			next_level()
			
func next_level():
	Global.door_name = "keluarrumah"
	DataManager.data["Settings"][name]= Global.door_name
	Global.door_name = DataManager.data["Settings"][name]
#	print(Global.door_name)
	DataManager.save_data()
	var ERR =  get_tree().change_scene(target_scene)
	
	if ERR != OK:
		print("not ok")
		
	
