extends CharacterBody2D

@export var speed: float = 100.0
var health = 20

func _ready() -> void:
	add_to_group("enemies")

func apply_damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		queue_free()

func _process(delta: float) -> void:
	var pf := get_parent() as PathFollow2D
	if pf == null:
		return

	pf.progress += speed * delta 

	if pf.progress_ratio >= 0.999:
		pf.progress_ratio = 1.0
		queue_free()
	
	if health <= 0:
		print("enemigo muerto")
#		get_parent().get_parent().queue_free()
