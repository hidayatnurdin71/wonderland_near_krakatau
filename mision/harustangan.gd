extends RichTextLabel

var dialog2 = ["Buka dengan tangan!!!"]
var page2 = 0

func _ready():
	set_bbcode(dialog2[page2])
	set_visible_characters(0)

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
