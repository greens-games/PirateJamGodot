extends Area2D
class_name Hurtbox

@onready var my_collider:CollisionShape2D = $HurtboxCollision

func _ready():
	if get_parent():
		get_parent().ready.connect(setup_collision_shape)
	pass

func setup_collision_shape():
	#get parent's collision shape
	if get_parent().has_node(Constants.COLLIDER_NAME) and !my_collider.shape:
		var parent_collider:CollisionShape2D = get_parent().get_node(Constants.COLLIDER_NAME)
		#set my colliison shape to all values as parent's
		for prop in parent_collider.get_property_list():
			my_collider.set(prop["name"], parent_collider.get(prop["name"])) 
			pass
	pass

func take_damage(damage_taken:int):
	print("you are taking some damage silly: ", damage_taken)
	if get_parent().has_method("calc_damage_taken"):
		get_parent().calc_damage_taken(damage_taken)
	pass
