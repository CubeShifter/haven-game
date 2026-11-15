extends Area2D


@onready var group = 0


func _on_body_entered(body: Node2D) -> void:
	for child in get_parent().get_parent().get_node("breads").get_children():
		child.open(group)
	visible = false
	queue_free()
