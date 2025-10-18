extends CharacterBody2D

var coins = 0
var health = 20

func apply_damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		#In the future tha enemies can apply different damages
		apply_damage(1)
		print("enemie entered, health is now", health)
