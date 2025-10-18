extends CharacterBody2D

var health = 20
var money = 0

func take_damage(amount: int) -> void:
	health -= amount
	print("Jugador golpeado. Health:", health)
	if health <= 0:
		die()

func die() -> void:
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name + " was detected by " + self.name)
	queue_free()
