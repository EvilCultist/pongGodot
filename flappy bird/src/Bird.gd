extends CharacterBody2D

@onready var vel = Vector2.ZERO

@export var jump : float = 10.0
@export var gravity : float = 30.0

func _ready():
	pass

func getinp():
	if Input.is_action_just_pressed("UP"):
		vel.y = -jump

func _physics_process(delta):
	getinp() 
	vel.y += delta*gravity
	var colliObject := move_and_collide(vel)
	if colliObject != null:
		_on_Bird_body_entered(colliObject.get_collider())

func _on_Bird_body_entered(body):
	if body.is_in_group("lethal"):
#		get_tree().paused = true
		self.queue_free()
	pass
