extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var bar_misi = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_tomboltutupmisi_released():
#	if bar_misi == true:
	$bar_misi.hide()



func _on_tekan_released():
	$bar_misi.show()


func _on_setting_pressed():
	get_tree().change_scene("res://rewardMenu.tscn")
