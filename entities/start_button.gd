extends Button
class_name StartButton

func _ready():
	self.pressed.connect(_on_button_clicked)


func _on_button_clicked():
	print("changing scenes")
	GameUtils.change_scene("res://testing/Test.tscn")


