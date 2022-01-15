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
onready var animationPlayer = $AnimationPlayer
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
var dialoggantitgn = false

func _ready():
#	if DataManager.data["Objects"].has(name):
#		global_position = DataManager.data["Objects"][name]
	if DataManager.data["Objects"].has("misipertama"):
		$CanvasLayer/bar_misi/temukan_celurit.show()
	if DataManager.data["Objects"].has("Celurite"):
		$CanvasLayer/bar_misi/temukan_celurit.hide()
		on_pick_tool()
		
	Autoload.connect("pick_tool", self, "_on_Box_clurite_pressed")
	Autoload.connect("ganti_tool", self, "on_ganti_tool")
	Autoload.connect("dialooog", self,"on_dialooog")
	Autoload.connect("misi1", self,"on_misi1")
	Autoload.connect("misi1selesai",self,"on_misi1selesai")
	
	Autoload.connect("ganti_tangan", self,"on_ganti_tangan")
	Autoload.connect("ketemu",self,"on_ketemu")
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
	$CanvasLayer/dialogceluritketemu.show()
	$CanvasLayer/bar_misi/cheklis.show()
	dialog_timer3.start()
	on_pick_tool()
func _on_Box_clurite_pressed():	
	on_pick_tool() # Replace with function body.

func _on_box_hand_pressed():
	on_ganti_tool()# Replace with function body.
func on_misi1():
	dialogmisi1 = true
#	$CanvasLayer/bar_misi.show()
	$CanvasLayer/bar_misi/temukan_celurit.show()
	$CanvasLayer/dialog_box.show()
#	$CanvasLayer/dialog_box/misipertama.show()
	dialog_timer.start()
func on_dialooog():
	dialooog =true
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
	


var coins = 0

func _on_COIN_coin_collected():
	coins = coins + 1
	_ready()

func on_misi1selesai():
	$CanvasLayer/selesaimisi1.show()
func _on_tombolx1_released():
	awalgame = false
	DataManager.data["Objects"]["awalgamesudah"]=["sudah"]
	DataManager.save_data()
	$CanvasLayer/awalgame.hide()