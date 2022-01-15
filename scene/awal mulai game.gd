extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_awal_mulai_game_body_entered(body):
#	if body.name == "character":
#		Autoload.emit_signal("awalgame")
#		queue_free()


func _on_awalmulaigame_body_entered(body):
	if body.name == "character":
		Autoload.emit_signal("dialooog")
		queue_free()
