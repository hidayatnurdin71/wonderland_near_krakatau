extends StaticBody2D

func _ready():
	if DataManager.data["Objects"].has("areamuncul"):
		Global.areaada = true
	if Global.areaada == false:
		get_node("CollisionShape2D").disabled = true
	if Global.areaada == true:
		get_node("CollisionShape2D").disabled = false
#		$CollisionShape2D.disabled(false)
