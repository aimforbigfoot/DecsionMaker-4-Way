extends Control

var tempObjA := ""
var tempObjB := ""




func _on_firstThing_text_changed(new_text: String) -> void:
	tempObjB = new_text


func _on_secondThing_text_changed(new_text: String) -> void:
	tempObjA = new_text


func _on_submitButton_pressed() -> void:
	if not tempObjA or not tempObjB:
		OS.alert("You need to enter in something for this app to work.", "Alert!")
	else:
		Global.objA = tempObjA
		Global.objB  = tempObjB
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://src/MainScreen.tscn")
