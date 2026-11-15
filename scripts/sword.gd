extends Area2D
@onready var image = $image
@onready var collision: CollisionShape2D = $CollisionShape2D

var on = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision.disabled = true
	image.modulate.a = 0.5
	

func get_direction():
	return Vector2(cos(rotation+ 0.5*PI),sin(rotation+ 0.5*PI))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not on:
		rotation = ( (get_parent().position -get_global_mouse_position()).angle()) - 0.5*PI
	
	
func hit():
	image.modulate.a = 1
	collision.disabled = false
	on = true
	await get_tree().create_timer(0.5).timeout
	
	
	
	image.modulate.a = 0.5
	collision.disabled = true
	on = false
