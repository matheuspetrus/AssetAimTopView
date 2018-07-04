extends Area2D

export (int) var velocity=350
export (int) var timeDestroy=120

var Rotation
var direction
var counterTimeDestroy = 0

var velocityRotation = Vector2()

func _ready():
	set_process(true)
	pass

func _start(rotation):
	Rotation = rotation
	pass
	
func _process(delta):
	
	counterTimeDestroy+= 1 
	
	velocityRotation= Vector2(velocity, direction).rotated(Rotation)
	
	translate(velocityRotation*delta)
	
	if counterTimeDestroy > timeDestroy:
		queue_free()
	pass