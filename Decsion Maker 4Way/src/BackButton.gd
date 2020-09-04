extends Button

func _ready() -> void:
	connect("pressed", self, "pressedd")


func pressedd() -> void:
	get_tree().change_scene("res://src/HomeScreen.tscn")
