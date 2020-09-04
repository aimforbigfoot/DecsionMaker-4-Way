extends Control

onready var anim_player := $AnimationPlayer


func _on_GoBack2_pressed() -> void:
	anim_player.play("toHome")


func _on_start_pressed() -> void:
	get_tree().change_scene("res://src/BeforeMainPage.tscn")
	


func _on_howToUse_pressed() -> void:
	anim_player.play("toHowTo")
