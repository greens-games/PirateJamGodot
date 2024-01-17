extends Node

func _spawn_base_enemy(wave:int) -> BaseEnemy:
	var enemy_to_spawn:BaseEnemy = load("res://entities/enemies/BaseEnemy.tscn").instantiate()
	enemy_to_spawn.my_stats = EnemyStats.new(4*wave, 3*wave, 100.0)
	return enemy_to_spawn
	


