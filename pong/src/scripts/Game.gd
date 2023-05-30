extends Node2D

var score: Vector2 setget set_score, get_score
var currball

export onready var ball = preload("res://src/scenes/Ball.tscn");

func get_score():
	return score

func set_score(var x):
	$Score.text = str(score.x) + " : " + str(score.y)
	score = x

func new_ball():
	currball = ball.instance()
	currball.transform = Transform2D(0, Vector2(512,300))
	call_deferred("add_child",currball)

func _ready():
	new_ball()
	set_score(Vector2(0,0))

func _process(_delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()

func on_ball_del(var pos):
	if pos < $Center.global_position.x:
		set_score(Vector2(score.x,score.y+1))
	else:
		set_score(Vector2(score.x+1,score.y))
	new_ball()
