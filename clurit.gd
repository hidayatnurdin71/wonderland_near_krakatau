extends KinematicBody2D
#var destroyed = false
#func destroy():
	#if not destroyed :
	#	destroyed = true
	#	queue_free()

#onready var tombolAK = $CanvasLayer/actionbutton
onready var tree = get_tree()

func _on_hurtboxclurit_body_entered(body):
	if body.name == "character":
		#Global.action = true
		print("clurit collect")
		#print(Global.action)
		queue_free()
		#muncul()
