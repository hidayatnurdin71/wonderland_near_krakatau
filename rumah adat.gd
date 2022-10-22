extends Node2D

func _on_exit_released():
	get_tree().change_scene("res://rewardMenu.tscn")


func _on_TouchScreenButton_released():
	$uidetail.hide()
	$detail.show()


func _on_exitt_released():
	$detail.hide()
	$uidetail.show()
