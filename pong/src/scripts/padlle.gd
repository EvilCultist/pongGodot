extends KinematicBody2D

onready var collibody = $CollisionShape2D
onready var colorRect = $ColorRect

export var left = true
export var size = 50
export var speed = 10

var no_hits = 0

var keyup: String
var keydown: String

func _ready():
	if left:
		keydown = "DOWN_LEFT"
		keyup = "UP_LEFT"
	else:
		keydown = "DOWN_RIGHT"
		keyup = "UP_RIGHT"

func _physics_process(_delta):
	var dir : Vector2 = Vector2.ZERO
	if Input.is_action_pressed(keydown) and Input.is_action_pressed(keyup):
		pass
	elif  Input.is_action_pressed(keyup):
		dir = Vector2.UP
	elif Input.is_action_pressed(keydown):
		dir = Vector2.DOWN
	if move_and_collide(dir * speed) != null:
		no_hits += 1
