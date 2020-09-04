extends HBoxContainer

var text_in_x := ""

func _ready() -> void:
	yield(get_tree().create_timer(0.1), "timeout")
	$properites.text = ("Properties of " + text_in_x)
