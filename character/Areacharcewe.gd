extends Area2D

var i = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Areacharcewe_body_entered(body):
	if body.name == "character":
		if Global.areaada == true:
			i = true
			Autoload.emit_signal("misi_anter")
