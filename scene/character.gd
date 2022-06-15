extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 80
const FRICTION = 500

var item_clurit = {}

enum {
	MOVE,
	ATTACK,
	AMBIL
}
var state = MOVE
var velocity = Vector2.ZERO
onready var dialog_timer0 = $CanvasLayer/awalgame/Timer
onready var dialog_timer = $CanvasLayer/dialog_box/Timer
onready var dialog_timer2 = $CanvasLayer/dialog_ganti/Timer
onready var dialog_timer3 = $CanvasLayer/dialogceluritketemu/Timer
onready var dialog_timer4 = $CanvasLayer/raden_intan3/Timer
onready var dialog_timer5 = $CanvasLayer/misi_anterbuah/Timer
onready var dialog_timer6 = $CanvasLayer/misi_terimabuah/Timer
onready var animationPlayer = $AnimationPlayer
onready var animationPlayer2 = $CanvasLayer/Animationpisang
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var joystick = $CanvasLayer/Joystick/JoyButton
#onready var joystick = get_parent().get_node("joystick/joystick_button")

var celurit = false
var kapak = false
var palu = false
var tangan = false
var dialogmisi1 = false
var awalgame = false
var dialooog = false
var raden_intan2 = false
var dialoggantitgn = false

func _ready():
#	if DataManager.data["Objects"].has(name):
#		global_position = DataManager.data["Objects"][name]
#	if DataManager.data["Objects"].has("misipertama"):
#		$CanvasLayer/bar_misi/temukan_celurit.show()
	if DataManager.data["Objects"].has("Celurite"):
#		$CanvasLayer/bar_misi/temukan_celurit.hide()
		on_pick_tool()
	if DataManager.data["Objects"].has("aksara1"):
		$CanvasLayer/raden_intan.queue_free()
	if DataManager.data["Objects"].has("misi1sudah"):
		$CanvasLayer/bar_misi/temukan_celurit.show()
		$CanvasLayer/bar_misi/cheklis.show()
		Autoload.emit_signal("janganmuncul")
	if DataManager.data["Objects"].has("temukanbuku"):
		$CanvasLayer/bar_misi/temukan_buku.show()
	if DataManager.data["Objects"].has("buah_diterima"):
		$CanvasLayer/misi_terimabuah.queue_free()
		$CanvasLayer/pisang.queue_free()
	if DataManager.data["Objects"].has("misi2"):
		$CanvasLayer/bar_misi/temukan_buku.show()
		$CanvasLayer/bar_misi/cheklis2.show()
		Autoload.emit_signal("sudah_dapat_kamus")
	Autoload.connect("pick_tool", self, "_on_Box_clurite_pressed")
	Autoload.connect("ganti_tool", self, "on_ganti_tool")
	Autoload.connect("dialooog", self,"on_dialooog")
	Autoload.connect("misi1", self,"on_misi1")
	Autoload.connect("misi1selesai",self,"on_misi1selesai")
	Autoload.connect("raden_intan2",self,"on_raden_intan2")
	Autoload.connect("ganti_tangan", self,"on_ganti_tangan")
	Autoload.connect("ketemu",self,"on_ketemu")
	Autoload.connect("buku_diambil",self,"on_buku_diambil")
	Autoload.connect("di_oke",self,"on_di_oke")
	Autoload.connect("raden_intan3",self,"on_raden_intan3")
	Autoload.connect("analog",self,"on_analog")
	Autoload.connect("misi_anter",self,"on_misi_anter")
	Autoload.connect("terima_buah",self,"on_terima_buah")
#	Autoload.connect("hiden",self,"on_hiden")
	animationTree.active = true

func _process(delta):
	
	match state:
		MOVE :
			move_state(delta)
		ATTACK :
			attack_state(delta)
		AMBIL :
			ambil_state(delta)
	
func move_state(delta):
	var input_vector =Vector2.ZERO
	#move_and_slidejoystick.get_value())* 100
	
	if OS.get_name() == "Windows":
		# KEYBOARD CONTROL
		input_vector.x =Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y =Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		input_vector = input_vector
	else:
		# JOYSTICK CONTROL
		input_vector = joystick.get_value()
	
	input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/idle/blend_position", input_vector)
		animationTree.set("parameters/jalan/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("jalan")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta) 
	#print(velocity)
	velocity = move_and_slide(velocity)
	if celurit:
		if Input.is_action_just_pressed("attack"):
			state = ATTACK
	if Input.is_action_just_pressed("ambil"):
		state = AMBIL
#	DataManager.data["Objects"][name]=global_position
#	DataManager.save_data()
func ambil_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("idle")

func attack_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")
	
func attack_animation_finished():
	state = MOVE

func on_pick_tool():
	celurit = true
	$CanvasLayer/box_kosong.hide()
	$CanvasLayer/Box_clurite.show()
	$CanvasLayer/Box_clurite/Sprite.show()
	$CanvasLayer/Box_clurite/seleksiefek.show()
	$CanvasLayer/box_hand/seleksiefek2.hide()
	$CanvasLayer/aksi.hide()
	$CanvasLayer/aksi_clurit.show()
	
func on_ganti_tool():
	celurit = false
	$CanvasLayer/Box_clurite/seleksiefek.hide()
	$CanvasLayer/box_hand/seleksiefek2.show()
	$CanvasLayer/aksi.show()
	$CanvasLayer/aksi_clurit.hide()
	
func on_ketemu():
#	Global.cluritketemu = true
	$CanvasLayer/dialogceluritketemu.show()
	$CanvasLayer/bar_misi/cheklis.show()
	dialog_timer3.start()
	on_pick_tool()
#	Autoload.emit_signal("misi1sudah")
	DataManager.data["Objects"]["misi1sudah"]=["sudah"]
	DataManager.save_data()
func _on_Box_clurite_pressed():	
	on_pick_tool() # Replace with function body.

func _on_box_hand_pressed():
	on_ganti_tool()# Replace with function body.
func on_misi1():
	dialogmisi1 = true
	get_tree().paused = true
#	$CanvasLayer/bar_misi.show()
	$CanvasLayer/lihat_misi/notif.show()
	$CanvasLayer/bar_misi/temukan_celurit.show()
	$CanvasLayer/dialog_box.show()
#	$CanvasLayer/dialog_box/misipertama.show()
	dialog_timer.start()
func on_dialooog():
	dialooog =true
	get_tree().paused = true
	$CanvasLayer/dialooog.show()
	
#func on_awalgame():
#	awalgame = true
#	$CanvasLayer/awalgame.show()
#	$CanvasLayer/awalgame/scriptawalgame.show()
#	dialog_timer0.start()
#func _on_TouchScreenButton_pressed():
#
#	dialogmisi1 = false
#	$CanvasLayer/dialog_box.hide()
#
func on_ganti_tangan():
	dialoggantitgn = true
	$CanvasLayer/dialog_ganti.show()
	$CanvasLayer/dialog_ganti/harustangan.show()
	dialog_timer2.start()
	print("harusnya adaaaaaaaaaaaa")

func _on_tombolx_pressed():
	dialoggantitgn = false
	$CanvasLayer/dialog_ganti.hide()
	$CanvasLayer/dialog_ganti/harustangan.hide()


func _on_xbutton_pressed():
	$CanvasLayer/dialogceluritketemu.hide()
	Autoload.emit_signal("muncul_panduan")
	$CanvasLayer/lihat_misi/notif.hide()
	


var coins = 0

func _on_COIN_coin_collected():
	coins = coins + 1
	_ready()

func on_misi1selesai():
	get_tree().paused = true
	$CanvasLayer/selesaimisi1.show()
func _on_tombolx1_released():
	awalgame = false
	DataManager.data["Objects"]["awalgamesudah"]=["sudah"]
	DataManager.save_data()
	$CanvasLayer/awalgame.hide()
func on_raden_intan2():
	$CanvasLayer/bar_misi/temukan_buku.show()
	$CanvasLayer/lihat_misi/notif.show()
	DataManager.data["Objects"]["temukanbuku"]=["sudah"]
	DataManager.save_data()
#	tampak = show()
#	raden_intan2 = true
	get_tree().paused = true
#	if i == "hide":
	if Global.dialogradenintan == true:
		$CanvasLayer/raden_intan.show()
	if Global.dialogradenintan == false:
		$CanvasLayer/raden_intan.hide()
#	if i == "show":
#		$CanvasLayer/raden_intan.hide()
#		i == "hide"
#var tampak = null
#var i = "hide"
#func on_hiden():
#	i = "show"

func on_buku_diambil():
	$CanvasLayer/box_hand.hide()
	$CanvasLayer/aksi.hide()
	$CanvasLayer/Joystick.hide()
	$CanvasLayer/base.hide()
	$CanvasLayer/box_kosong.hide()
	$CanvasLayer/buku_pengetahuan.hide()
func on_di_oke():
	$CanvasLayer/lihat_misi/notif.hide()
	$CanvasLayer/box_hand.show()
	$CanvasLayer/aksi.show()
	$CanvasLayer/Joystick.show()
	$CanvasLayer/base.show()
	$CanvasLayer/box_kosong.show()
	$CanvasLayer/buku_pengetahuan.show()
	$CanvasLayer/bar_misi/cheklis2.show()
	DataManager.data["Objects"]["misi2"]=["sudah"]
	DataManager.save_data()
func on_raden_intan3():
#	get_tree().paused = true
#	if i == "hide":
#	if Global.dialogradenintan2 == true:
	$CanvasLayer/raden_intan3.show()
	dialog_timer4.start()
#	if Global.dialogradenintan2 == false:
#		$CanvasLayer/raden_intan3.hide()

func on_analog():
	if Global.muncull == true:
		$CanvasLayer/Joystick.hide()
	if Global.muncull == false:
		$CanvasLayer/Joystick.show()
func _on_xbutton_released():
	$CanvasLayer/raden_intan3.hide()
func on_misi_anter():
	get_tree().paused = true
	$CanvasLayer/misi_anterbuah.show()
	dialog_timer5.start()
	$CanvasLayer/pisang.show()
	animationPlayer2.play("pisang")
#	if Global.misi_anter == true:
#		$CanvasLayer/pisang.show()
func on_terima_buah():
	get_tree().paused = true
	$CanvasLayer/misi_terimabuah.show()
	dialog_timer6.start()
	
#	if Global.misi_anter_selesai == true:
	$CanvasLayer/pisang.hide()
