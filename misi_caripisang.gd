extends Area2D

func _ready():
	pass
func _on_misi_caripisang_body_entered(body):
	if body.name == "character":
		if Global.misi4muncul == true:
			Autoload.emit_signal("pohon_pisang")
		if Global.misi4muncul == false:
			null
