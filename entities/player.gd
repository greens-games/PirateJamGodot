extends CharacterBody2D


const SPEED = 300.0

func _ready():
	print(PlayerStats.player_health)
	pass

func _physics_process(delta):


	# Logic for moving player
	var direction_x = Input.get_axis("move_left", "move_right")
	var direction_y = Input.get_axis("move_up", "move_down")
	if direction_x:
		velocity.x = direction_x * SPEED

	if direction_y:
		velocity.y = direction_y * SPEED

	if !direction_y and !direction_x:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)


	#Do move and slide after setting all velocities
	move_and_slide()
