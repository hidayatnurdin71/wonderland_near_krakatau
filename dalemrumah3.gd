extends Node2D


onready var character = $YSort/character
onready var pisang = $YSort/character/pisang
# Called when the node enters the scene tree for the first time.
func _ready():
	if DataManager.data["Objects"].has("misi_ketiga_terkunci"):
		Global.npc_afnan = false
	if DataManager.data["Objects"].has("buah_diterima"):
		pisang.queue_free()
	if DataManager.data["Objects"].has("character_rumah3"):
		character.global_position = DataManager.data["Objects"]["character_rumah3"]
		
#	print(Global.door_name)
#	print(Global.ceeluritdipake)
#	print(Global.celuritkondisi)
#	if Global.door_name:
#			var door_node = find_node(Global.door_name)
#			if door_node:
#				$YSort/character.global_position = door_node.global_position
				
	
	pass

func _process(delta):
	DataManager.data["Objects"]["character_rumah3"] = character.global_position
	DataManager.save_data()
