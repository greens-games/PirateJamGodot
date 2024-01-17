extends Area2D
class_name Hitbox

@onready var my_collider:CollisionShape2D = $HitboxCollision

func _ready():
	if get_parent():
		get_parent().ready.connect(setup_collision_shape)

	self.area_entered.connect(_entered_hurtbox)
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

func _entered_hurtbox(area:Area2D):
	var damage_to_deal:int
		

	if area is Hurtbox and area.get_parent() != get_parent():
		if get_parent() and get_parent().has_method("calc_damage"):
			print("parent deals damage")
			#calc damage will contain all the info for whoever's hitbox this is to give this signal the damage needing to be done
			damage_to_deal = get_parent().calc_damage() 
		monitoring = false
		if damage_to_deal:
			area.take_damage(damage_to_deal)


