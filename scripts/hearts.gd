extends Node2D

var health = 2	

@onready var hearts = [get_node("0"),get_node("1"),get_node("2")]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in range(3):	
		if Global.health-1>=i:
			hearts[i].visible = true
		else:
			hearts[i].visible = false
	
