extends CharacterBody2D

var target: Node2D = null           
var speed: float = 1000.0
var path: String = ""               
var bulletDamage

func _physics_process(delta: float) -> void:
	var spawner := get_tree().get_root().get_node("Main/Spawner")

	var found: Node2D = null
	for i in range(spawner.get_child_count()):
		var child := spawner.get_child(i)
		if child.name == path:
			var n := child.get_child(0).get_child(0)
			if n is Node2D:
				found = n
			break

	if found != null and is_instance_valid(found):
		target = found

	if target == null or !is_instance_valid(target):
		return

	var target_pos: Vector2 = target.global_position

	velocity = global_position.direction_to(target_pos) * speed
	look_at(target_pos)                 
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name.contains("Soldier"):
		queue_free()
