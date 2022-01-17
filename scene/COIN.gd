extends KinematicBody2D
signal coin_collected
var target_position = Vector2.ZERO
var a = [1,2,3,4,5]
#onready var rng = RandomNumberGenerator.new()

func _ready():
#	randomize()
	a.shuffle()
	print (a)
	var res = a[0]
	print(res)
#	while res == 0:
#		res = a[1]
#		print(rand_range(0, a.size()))
	var angle = 2.0 * PI / res
#	print(angle)
	var radius = 12
	var vect = Vector2(cos(angle), sin(angle)) * radius
#	print(vect)
	var offset = Vector2(4,4)
	target_position = global_position + offset + vect
	pop(offset, target_position)
#	print(target_position)
		
func pop(offset, target):
	$Tween.interpolate_property(self, "global_position", global_position + offset, target, 0.5, Tween.TRANS_EXPO, Tween.EASE_OUT)
	$Tween.start()

#	print(round(a[rand_range(0, a.size())]))
	$Anim.play("BOUNCE")
	
	
func _on_Tween_tween_completed(object, key):
	$Anim.play("COINS")
	$kolekarea.monitoring = true # Only allow coin to be collected after bounce finished.


func _on_kolekarea_body_entered(body):
	if body.is_in_group("character"):
		collected()
#		emit_signal("coin_collected")
#		Global.coin_collected = true
#		print(Global.coin_collected)
#		print("Collect One Coin") # We can add more functions here to interact with Player Inventory or Money future
#		queue_free()
func collected():
	emit_signal("coin_collected")
	Global.coin_collected = true
	Global.coins += 1
	
	print(Global.coin_collected)
	print(Global.coins)
	print("Collect One Coin") # We can add more functions here to interact with Player Inventory or Money future
	queue_free()
