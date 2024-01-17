extends CharacterBody2D
class_name BaseEnemy

var my_stats:EnemyStats
@onready var nav_agent:NavigationAgent2D = $EnemyNavAgent
var curr_target:Player
var curr_target_pos:Vector2

func _ready():
	pass

func _physics_process(_delta):
	if !curr_target:
		curr_target = get_tree().get_first_node_in_group("player")
	if curr_target:
		curr_target_pos = curr_target.global_position
		nav_agent.target_position = curr_target_pos
	var next_pos = nav_agent.get_next_path_position()
	velocity = global_position.direction_to(next_pos) * my_stats.move_speed
	move_and_slide()
	pass

func calc_damage() -> int:
	print("calculating damage")
	var damage_modifiers = 1
	return my_stats.damage + damage_modifiers
