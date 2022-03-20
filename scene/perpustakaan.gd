extends Node2D

onready var character = $YSort/character
# Called when the node enters the scene tree for the first time.
func _ready():
	if DataManager.data["Objects"].has("character_perpus"):
		character.global_position = DataManager.data["Objects"]["character_perpus"]
	if DataManager.data["Objects"].has("buku"):
		$book_01.queue_free()
	Autoload.connect("buku_diambil",self,"on_buku_diambil")
#	print(Global.door_name)
#	print(Global.ceeluritdipake)
#	print(Global.celuritkondisi)
#	if Global.door_name:
#			var door_node = find_node(Global.door_name)
#			if door_node:
#				$YSort/character.global_position = door_node.global_position
				
	
func on_buku_diambil():
	
	$CanvasLayer/ColorRect.show()
	$CanvasLayer/animation_book.show()
	$CanvasLayer/tombolx2.show()
	$CanvasLayer/oke.show()
	$book_01.queue_free()
func _process(delta):
	DataManager.data["Objects"]["character_perpus"] = character.global_position
	DataManager.save_data()


func _on_tombolx2_released():
	$CanvasLayer.queue_free()
	Autoload.emit_signal("di_oke")
