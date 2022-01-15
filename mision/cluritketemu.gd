extends RichTextLabel

var dialog3 = ["KETEMU!!!.... sepertinya ini ALAT yang dimaksut untuk memotong rumput"]
var page3 = 0

func _ready():
	set_bbcode(dialog3[page3])
	set_visible_characters(0)

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
