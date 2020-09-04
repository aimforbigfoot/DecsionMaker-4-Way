extends HBoxContainer

signal valueChanged
var value := 1.0
var parentName : String = ""

func _ready() -> void:
# warning-ignore:return_value_discarded
	connect("valueChanged", get_parent().get_parent().get_parent().get_parent(), "update_text")
	parentName = (get_parent().name)
#	emit_the_value_changed_signal()


func _on_delButton_pressed() -> void:
	emit_the_value_changed_signal()
	queue_free()


func _on_value_text_changed(new_text: String) -> void:
	if float(new_text):
		value = float(new_text)
#		print(value)
		emit_the_value_changed_signal()
	else:
		value = 1
		if Global.alertPlayer == false:
			Global.alertPlayer = true
			OS.alert("Please put a number in this spot, The defualt value is 1, you didn't break any code, I already saw this coming, but it would help you make your decsion if you put a number in", "Hey!")
func _on_labelPiece_tree_exiting() -> void: emit_the_value_changed_signal()

func _on_addMoreCons_pressed() -> void: emit_the_value_changed_signal()

func _on_addMoreBtnPros_pressed() -> void:emit_the_value_changed_signal()

func _on_userInfo_text_changed(_new_text: String) -> void:emit_the_value_changed_signal()



func emit_the_value_changed_signal() -> void:
	emit_signal("valueChanged", parentName)






