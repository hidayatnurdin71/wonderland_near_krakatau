extends Area2D

func _ready():
	pass # Replace with function body.

func _on_setelah_sabit_ketemu_body_entered(body):
	if body.name == "character":
		Autoload.emit_signal("misi1selesai")
		queue_free()
		
