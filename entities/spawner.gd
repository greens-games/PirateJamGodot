extends Node

@onready var right_marker:Marker2D = $RightMarker
@onready var left_marker:Marker2D = $LeftMarker
@onready var up_marker:Marker2D = $UpMarker
@onready var down_marker:Marker2D = $DownMarker

var right_pos:Vector2
var left_pos:Vector2
var up_pos:Vector2
var down_pos:Vector2
var enemies_to_spawn:int = 5

# Called when the node enters the scene tree for the first time.
func _ready():

	right_pos = right_marker.position
	left_pos = left_marker.position
	up_pos = up_marker.position
	down_pos = down_marker.position

	spawn_enemies()

	#This is where we will start the timer
	#On timeout spawn_enemies()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_random_pos() -> Vector2:
	var rng:RandomNumberGenerator = RandomNumberGenerator.new()
	var spawn_location:Vector2 = Vector2(rng.randf_range(left_pos.x, right_pos.x),rng.randf_range(up_pos.y,down_pos.y)) 
	return spawn_location

func spawn_enemies():
	for i in range(enemies_to_spawn):
		var other_pos:Vector2 = get_random_pos()
		var enemy_to_spawn:BaseEnemy = EnemySpawns._spawn_base_enemy(1)
		enemy_to_spawn.position = other_pos
		add_child(enemy_to_spawn)
