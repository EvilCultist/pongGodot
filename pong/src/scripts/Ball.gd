extends KinematicBody2D

var rnjesus = RandomNumberGenerator.new()
var direc : Vector2 = Vector2.ZERO;
export var speed : int = 5;

func _ready():
	rnjesus.randomize()
	var x = rnjesus.randf_range(-10,10)
	var y = rnjesus.randf_range(-10,10)
	direc = Vector2(x,y).normalized() * speed
	print($VisibilityNotifier2D.connect("screen_exited",get_parent(),"on_ball_del",[global_position.x]))

func _physics_process(_delta):
	var tempo: KinematicCollision2D = move_and_collide(direc)
	if tempo != null:
		direc = direc.bounce(tempo.normal)


func _on_VisibilityNotifier2D_screen_exited():
#	var pos = get_parent().get_node("Center").global_position
#	get_parent().on_ball_del(global_position.x < pos.x)
	queue_free()
