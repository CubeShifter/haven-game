extends CharacterBody2D


var can_get_hit = true

const SPEED = 160

@onready var sword: Area2D = $sword
@onready var sprite: AnimatedSprite2D = $sprite
@onready var hurtbox: Area2D = $hurtbox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var y = Input.get_axis("up","down")
	var x = Input.get_axis("left","right")
	
	var dir = Vector2(Input.get_axis("left","right"),Input.get_axis("up","down")).normalized()
	velocity = SPEED*dir
	
	if x == -1:
		sprite.play("left")
	elif x == 1:
		sprite.play("right")
	elif y == 1:
		sprite.play("down")
	elif y ==-1:
		sprite.play("up")
	
	if Input.is_action_just_pressed("attack"):
		sword.hit()
	
	move_and_slide()
	

	




func _on_hurtbox_body_entered(body: Node2D) -> void:
	print("meow")
	if can_get_hit:
		can_get_hit = false
		Global.health -=1
		await get_tree().create_timer(1.0).timeout
		can_get_hit = true
		
