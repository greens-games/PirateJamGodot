extends Node


func get_node_by_component():
	print("getting node by component")
	pass

func create_timer(time_in_seconds:float, function_to_call:Callable) -> Timer:
	print("creating timer")
	var timer = Timer.new()
	timer.wait_time = PlayerStats.dash_cd
	timer.timeout.connect(function_to_call)
	add_child(timer)
	timer.start(0)
	print("starting timer")
	return timer
	pass

func change_scene(new_scene:String):
	PlayerStats.reset_health()
	get_tree().change_scene_to_file(new_scene)
	pass

