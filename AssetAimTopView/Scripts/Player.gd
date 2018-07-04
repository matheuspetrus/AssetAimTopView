extends Node2D

var mpos = Vector2()
var mposGlobal = Vector2()
var gunShot = preload("res://Scenes/Shot.tscn")
var shot =false
export (int) var velocity=350
func _ready():
	set_process(true)
	get_node("Control/TextEdit").text=str(velocity)
	pass

func _process(delta):
	
	mpos = get_local_mouse_position()
	mposGlobal= get_global_mouse_position()
	
	
	if get_node("Control/TextEdit").text !=str(velocity):
		velocity =int(get_node("Control/TextEdit").text)
	
	if Input.is_action_pressed("ui_select") and not shot:
		
		var b = gunShot.instance()
		get_parent().add_child(b)
		b.global_position= global_position
		var a = (mposGlobal - global_position).angle()
		b._start(a)
		b.velocity=velocity
		if mpos.x <=0:
			b.direction= -1
		else :
			b.direction =1
		
	shot = Input.is_action_pressed("ui_select")
	pass


func _on_Button_pressed():
	velocity-=1
	get_node("Control/TextEdit").text=str(velocity)
	pass # replace with function body


func _on_Button2_pressed():
	velocity+=1
	get_node("Control/TextEdit").text=str(velocity)
	pass # replace with function body
