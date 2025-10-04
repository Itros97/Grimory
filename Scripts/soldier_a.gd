extends CharacterBody2D

@export var speed: float = 100.0

func _process(delta: float) -> void:
	var pf := get_parent() as PathFollow2D
	if pf == null:
		return

	pf.progress += speed * delta 

	if pf.progress_ratio >= 0.999:
		pf.progress_ratio = 1.0
		queue_free()
