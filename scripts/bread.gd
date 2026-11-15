extends StaticBody2D

@onready var sprite: AnimatedSprite2D = $sprite
@onready var bob: CollisionShape2D = $bob
@export var group = 0
# Called when the node enters the scene tree for the first time.

func open(groub):
	
	if groub == group:
		bob.queue_free()
		sprite.play("open")
