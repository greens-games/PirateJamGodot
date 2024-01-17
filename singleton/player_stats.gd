extends Node

var player_health:int = 10
var dashing:bool = false
var dash_speed:float = 1000.0
var dash_distance:float = 200.0
var dash_cd:float = 0.5


func reset_health():
	player_health = 10
