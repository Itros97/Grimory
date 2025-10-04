extends StaticBody2D

var bullet = preload("res://Turrets/bulletTurretA.tscn")
var bulletDamage = 10
var path
var targets = []
var actualTarget


func _on_range_body_entered(body: Node2D) -> void:
	if "SoldierA" in body.name:
		var tArray = []
		targets = get_node("range").get_overlapping_bodies()
		
		for i in targets:
			if "Soldier" in i.name:
				tArray.append(i)
		var cTarget = null
		for i in tArray:
			if cTarget == null:
				cTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > cTarget.get_progress():
					cTarget = i.get_node("../")
		actualTarget = cTarget
		path = actualTarget.get_parent().name
		
		var tBullet = bullet.instantiate()
		tBullet.path = path
		tBullet.bulletDamage = bulletDamage
		get_node("BulletCanon").add_child(tBullet)
		tBullet.global_position = $Barrel.global_position
		
func _on_range_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
