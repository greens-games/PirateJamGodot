extends RefCounted
class_name  EnemyStats

#properties
var health:int 
var damage:int 
var move_speed:float


func _init(init_health:int, init_damage:int, init_move_speed:float):
	health = init_health
	damage = init_damage
	move_speed = init_move_speed
	pass
