extends Area2D

#func _on_awal_mulai_game_body_entered(body):
#	if body.name == "character":
#		Autoload.emit_signal("awalgame")
#		queue_free()

func _on_awalmulaigame_body_entered(body):
	if body.name == "character":
		Autoload.emit_signal("dialooog")
		
		queue_free()
