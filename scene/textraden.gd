extends RichTextLabel


var dialog3 = ["Raden Intan II"]
var page3 = 0

func _ready():
	set_bbcode(dialog3[page3])
	set_visible_characters(0)

func _on_Timer2_timeout():
	set_visible_characters(get_visible_characters()+1)
