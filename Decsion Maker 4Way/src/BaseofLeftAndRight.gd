extends VBoxContainer

onready var prosList := $VBoxContainer/ScrollContainer/prosList
onready var consList := $VBoxContainer2/ScrollContainer2/consList
onready var finalAmt := $FinalAmt
var prosValue :float= 0.0
var consValue :float= 0.0
var childPlace := 1
var text_in_x := ""

func _ready() -> void:
	for i in get_parent().get_child_count():
		if get_parent().get_child(i) == self:
			print(i)
			childPlace = i
	if childPlace == 1:
		text_in_x = Global.objA
	else:
		text_in_x = Global.objB
	$VBoxContainer/prosOfXY.text = ("Pros of "+ text_in_x)
	$VBoxContainer2/ConsOfXY.text = ("Cons of "+ text_in_x)
	$VBoxContainer/simpleInstructions.text_in_x = text_in_x
	$VBoxContainer2/simpleInstructions.text_in_x = text_in_x
#this is spaget code, but I'm not 100% sure how to fix it
func _on_addMoreBtnPros_pressed() -> void:
	if prosList.get_child_count() > 1:
		var sndLastNode := prosList.get_child( prosList.get_child_count()-2 )
		var labelPiece := preload("res://src/labelPiece.tscn").instance()
		prosList.add_child_below_node(sndLastNode, labelPiece)
		labelPiece.emit_the_value_changed_signal()
	elif prosList.get_child_count() == 1:
		var labelPiece := preload("res://src/labelPiece.tscn").instance()
		prosList.add_child(labelPiece)
		prosList.move_child(labelPiece,0)
		labelPiece.emit_the_value_changed_signal()

func _on_addMoreCons_pressed() -> void:
	if consList.get_child_count() > 1:
		var sndLastNode := consList.get_child( consList.get_child_count()-2 )
		var labelPiece := preload("res://src/labelPiece.tscn").instance()
		consList.add_child_below_node(sndLastNode, labelPiece)
		labelPiece.emit_the_value_changed_signal()
	elif consList.get_child_count() == 1:
		var labelPiece := preload("res://src/labelPiece.tscn").instance()
		consList.add_child(labelPiece)
		consList.move_child(labelPiece,0)
		labelPiece.emit_the_value_changed_signal()


func update_text( parentName: String) -> void:
#	yield(get_tree().create_timer(0.1), "timeout")
	if parentName == "prosList":
		prosValue = 0
		for i in prosList.get_child_count():
			if i < prosList.get_child_count()-1:
					prosValue += prosList.get_child(i).value
	elif parentName == "consList":
		consValue = 0
		for i in consList.get_child_count():
			if i < consList.get_child_count()-1:
					consValue += consList.get_child(i).value
		
	else:
		print("error, parent name not defind")
	var final := (prosValue-consValue)
	var extra := ""
	if sign(final) == -1:
		extra = "negative "
	
	finalAmt.text = ("Overall Score is "+ extra +str(final))
	print(final)



func _on_Timer_timeout() -> void:
	prosList.get_child(0).emit_the_value_changed_signal()
	consList.get_child(0).emit_the_value_changed_signal()
	
