extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	

	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Areamisi_body_entered(body):
	if body.name == "character":
		Autoload.emit_signal("misi1")
		Autoload.emit_signal("muncul_sabit")
		queue_free()
