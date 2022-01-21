extends Node2D
#onready var tombolAK = $CanvasLayer/actionbutton
#onready var tree = get_tree()
#var hey = false
# Called when the node enters the scene tree for the first time.
onready var current_room = Global.map
var dalem_rumah = preload("res://scene/bagian/dalemrumahliwa.tscn").instance()
var peta = preload("res://peta.tscn").instance()

func _ready():
#	print(Global.jejak)
#	if DataManager.data["Objects"].has("Node2D:1625"):
#		self.add_child(dalem_rumah)
#	else:
#		self.add_child(peta)
	if DataManager.data["Objects"].has("dialogbpk"):
		Global.dialogbpk = false
	change_room()
	Autoload.connect("push_door", self, "on_push_door")
#	if DataManager.data["Settings"].has(name):
#		var nama_map =DataManager.data["Settings"][name]
#		Global.map = nama_map
	
	
#	self.add_child(change_room)
#	print(Global.door_name)
#	if DataManager.data["Settings"].has("keluarrumah"):
#		var pintu =DataManager.data["Settings"][name]
#		Global.door_name = pintu
	
#	if Global.door_name == "keluarrumah":
#		print(Global.door_name)
#		var door_node = find_node(Global.door_name)
#		if door_node:
#			$peta/YSort/character.global_position = door_node.global_position
	#Global.action = hey
	#print (Global.action)
	#tombolAK.visible= Global.action
	#print("apa")
	#muncul()
func change_room():
	if DataManager.data["Settings"].has(name):
		var nama_map =DataManager.data["Settings"][name]
		Global.map = nama_map
#	print(Global.map)
#	Global.map = nama_map
	current_room = Global.map
	print(Global.map)
	if current_room == "peta":
		self.add_child(peta)
	if current_room == "dalem_rumah":
		self.add_child(dalem_rumah)

#func _input(event):
#	if event.is_action_pressed("change_map"):
#		if self.get_child(0).name == "peta":
#			self.remove_child(self.get_child(0))
#			self.add_child(dalem_rumah)
#		else:
#
#			self.remove_child(self.get_child(0))
#			self.add_child(peta)
			
	#	var muncull = find_node(Global.action)
	#	if muncull:
	#		$"CanvasLayer/action button".visible = muncull
	#		print("munnnculll")
onready var jejak
func on_push_door():
	if self.get_child(0).name == "peta":
		self.remove_child(self.get_child(0))
		Global.map = "dalem_rumah"
#		print(Global.map)
		DataManager.data["Settings"][name]= "dalem_rumah"
		Global.map = DataManager.data["Settings"][name]
		DataManager.save_data()
#		print(Global.jejak)
		
		self.add_child(dalem_rumah)
#		DataManager.data["Objects"][name]=dalem_rumah
#		print(DataManager.data["Objects"][name])
#		DataManager.save_data()
	else:
		
		self.remove_child(self.get_child(0))
		Global.map = "peta"
#		print(Global.map)
		DataManager.data["Settings"][name]= "peta"
		Global.map = DataManager.data["Settings"][name]
		DataManager.save_data()
		self.add_child(peta)
#		DataManager.data["Objects"][name]=peta
#		print(DataManager.data["Objects"][name])
#		DataManager.save_data()
			
