extends Node2D
var i = false
func _ready():
	$oke.hide()
	Autoload.connect("tekan",self,"anima2")
	transisi()
func transisi():
	$AnimationPlayer.play("New Anim")
	i = true
	if i == true:
		Autoload.emit_signal("tekan")
func anima2():
	$oke.show()
	$AnimationPlayer2.play("tekan")
