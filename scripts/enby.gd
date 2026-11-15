extends CharacterBody2D
class_name enby
var disabled = false
var sword
var knockbacked := false
func _ready() -> void:
	sword = get_parent().get_parent().get_node("player").get_node("sword")
	var collision = get_node("Area2D")
	collision.area_entered.connect(meow)

func _physics_process(delta: float) -> void:
	
	
	if velocity.length() <1:
		knockbacked = false	
	velocity *= 0.9
	if not knockbacked:
		move()
		
	move_and_slide()

func move():
	var player = get_parent().get_parent().get_node("player")
	velocity = (player.global_position - global_position).normalized() * 32

func meow(area: Area2D):
	knockbacked = true
	velocity = -480 * sword.get_direction()
	


func _on_death_zone_body_entered(body: Node2D) -> void:
	print("mrrrp")
	var pos = position
	position = Vector2(5000,5000)
	await get_tree().create_timer(10).timeout
	
	position = pos + 32	*Vector2(cos(randf_range(0,2*PI)),sin(randf_range(0,2*PI)))
