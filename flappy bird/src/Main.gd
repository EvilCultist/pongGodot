extends Node2D

@onready var point := $spawnZone/spawnPoint
@onready var tree := get_tree()

@export var pipeScene: PackedScene
@export var gap: int = 200
var score:float = 0

func _ready():
#	$Timer.start()
	$Timer.connect("timeout", spawnPipe)

func _process(_delta):
	if Input.is_action_pressed("pause"):
		tree.paused = true
	if Input.is_action_pressed("quit"):
		tree.quit()
	if Input.is_action_pressed("reset"):
		tree.change_scene_to_file("res://src/Main.tscn")

func spawnPipe():
	var no1 = pipeScene.instantiate()
	var no2 = pipeScene.instantiate()
	point.progress_ratio = randf()
#	var loc = point.position
	no1.position = point.position
	no2.position = point.position
	no1.rotation = deg_to_rad(180)
	@warning_ignore("integer_division")
	no1.position.y -= (gap/2) as int
	@warning_ignore("integer_division")
	no2.position.y += (gap/2) as int
	$pipes.add_child(no1)
	$pipes.add_child(no2)


func _on_score_counter_body_entered(_body):
	score += 0.5
