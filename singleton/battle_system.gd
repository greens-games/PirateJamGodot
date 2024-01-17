extends Node
class_name BattleSystem

#Timer for the spawner
#Markers for the spawn locations
#Each spawner needs a timer and markers for each spawn location init

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.add_to_group("player")
	print("Player is in group?", $Player.is_in_group("player"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_timer(time_in_seconds:float):
	pass
