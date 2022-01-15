extends RichTextLabel

var dialog1 = ["ada rumput yang menghalangi jalan!!!, bisakah kamu membantuku agar bisa melewati nya?"]
var page = 0
func _ready():

	set_bbcode(dialog1[page])
	set_visible_characters(0)

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	DataManager.data["Objects"][name]= [name]
	DataManager.save_data()
