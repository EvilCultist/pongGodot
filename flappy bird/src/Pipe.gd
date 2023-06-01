extends StaticBody2D

@export var pipe_speed: int = 100

func _ready():
	self.set_physics_process(false)

func _process(delta):
	position.x -= pipe_speed*delta
