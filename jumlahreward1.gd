extends RichTextLabel
var jumlah
var a = [1,2,3,4,5]
var reward = false
func _ready():
#	randomize()
	a.shuffle()
	print (a)
	var res = a[0]
	print(res)
	text = String(res)
	Global.reward = res

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
