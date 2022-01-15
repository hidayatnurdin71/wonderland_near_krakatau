extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if DataManager.data["Objects"].has(name):
		var nama_tools =DataManager.data["Objects"][name]
		Global.toolls = nama_tools
		$Sprite.queue_free()
		$CollisionShape2D.queue_free()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name == "character":
		Autoload.emit_signal("ketemu")
		queue_free()
		DataManager.data["Objects"][name]= [name]
		Global.toolls=DataManager.data["Objects"][name]
		print(Global.toolls)
		DataManager.save_data()
