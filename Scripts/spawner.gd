extends Node2D

@onready var path = preload("res://Scenes/nivel1Path.tscn")

func _on_timer_timeout() -> void:
	var tpath = path.instantiate()
	add_child(tpath)
