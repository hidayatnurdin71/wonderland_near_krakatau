extends RichTextLabel
var jumlah
var a = [2,3,4,5,6,7]
var reward = false
func _ready():
	a.shuffle()
	print (a)
	var res = a[0]
	print(res)
	text = String(res)
	Global.reward = res
	
