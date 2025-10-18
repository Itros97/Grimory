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

func _on_Area2D_body_entered(body: Node2D) -> void:
	print("Objeto en colisión:", body)
	if body.is_in_group("enemies"):
		take_damage(1)
