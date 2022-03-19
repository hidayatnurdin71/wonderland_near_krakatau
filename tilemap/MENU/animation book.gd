extends Node2D

func _on_exit_released():
	get_tree().change_scene("res://scene/bagian/WORLD.tscn")
