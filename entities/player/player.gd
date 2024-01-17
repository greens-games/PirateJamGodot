extends CharacterBody2D
class_name Player

#Constants
const SPEED = 300.0

#Properties
var starting_spot:Vector2
var dash_direction:Vector2
var timer:Timer
var can_dash:bool
var my_hurtbox:Hurtbox

#Onready properties
@onready var my_collider:CollisionShape2D = $Collider

func _ready():
	can_dash = true
	print("Player is readyu")
	pass

func _physics_process(delta):

	# Logic for moving player
	if !PlayerStats.dashing:
		var direction_x = Input.get_axis("move_left", "move_right")
		var direction_y = Input.get_axis("move_up", "move_down")
		if direction_x:
			velocity.x = direction_x * SPEED

		if direction_y:
			velocity.y = direction_y * SPEED

		if !direction_y and !direction_x:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED)

		if Input.is_action_just_pressed("dash") and (direction_x or direction_y) and can_dash:
			PlayerStats.dashing = true
			starting_spot = global_position
			dash_direction = Vector2(direction_x, direction_y)
			can_dash = false
	
			#start dash cd
			timer = GameUtils.create_timer(PlayerStats.dash_cd, reset_dash_cd)
			pass

		move_and_slide()

	if PlayerStats.dashing:
		my_collider.disabled = true
		velocity = PlayerStats.dash_speed * dash_direction
		var distance_travelled_x = global_position.x - starting_spot.x
		var distance_travelled_y = global_position.y - starting_spot.y
		if (abs(distance_travelled_x) + abs(distance_travelled_y)) >= PlayerStats.dash_distance:
			PlayerStats.dashing = false
			my_collider.disabled = false
		pass
		move_and_slide()
	
	#Do move and slide after setting all velocities

func reset_dash_cd():
	print("resetting cd")
	can_dash = true
	timer.queue_free()

func calc_damage_taken(damage_taken:int):
	var defence_modifiers:int = 0
	PlayerStats.player_health -= (damage_taken - defence_modifiers)
	if PlayerStats.player_health <= 0:
		queue_free()
		GameUtils.change_scene("res://scenes/MainMenu.tscn")
