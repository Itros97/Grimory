extends Node

var coins = 0

func add_coins(amount: int) -> void:
	coins += amount
	print("Las monedas son :", coins)
