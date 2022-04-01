extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if DataManager.data["Objects"].has("areamuncul"):
		Global.areaada = true
	if Global.areaada == false:
		get_node("CollisionShape2D").disabled = true
	if Global.areaada == true:
		get_node("CollisionShape2D").disabled = false
#		$CollisionShape2D.disabled(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
