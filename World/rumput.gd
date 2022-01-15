extends Node2D
func _ready():
	if DataManager.data["Settings"].has(name):
		var nama_rumput =DataManager.data["Settings"][name]
		Global.rumputt = nama_rumput
		$Sprite.queue_free()
		$CollisionShape2D.queue_free()
		$hurtbox.queue_free()

func create_grass_effect():
	var efekRumput = load("res://Effects/efekrumput.tscn")
	var Efekrumput = efekRumput.instance()
	var world = get_tree().current_scene
	world.add_child(Efekrumput)
	Efekrumput.global_position = global_position


var coin = preload("res://scene/COIN.tscn")

	
func _on_hurtbox_area_entered(area):
	create_grass_effect()
	print("rumput hilang")
	queue_free()
	DataManager.data["Settings"][name]= [name]
	Global.rumputt=DataManager.data["Settings"][name]
	print(Global.rumputt)
	DataManager.save_data()
	var coin_node = coin.instance()
	coin_node.position = position
	get_parent().add_child(coin_node)
