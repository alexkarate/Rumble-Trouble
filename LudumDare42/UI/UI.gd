extends Control
signal delete_all_UI


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func UpdateUI(var needekKeys, var currentKeys, var currentLevel):
	emit_signal("delete_all_UI")
	var curKey 
	for i in range(currentKeys):
		curKey = preload("res://UI/Keys/KeyFilled/KeyFilled.tscn").instance()
		$KeyBox.add_child(curKey)
		connect("delete_all_UI", curKey, "DeleteUI")
		pass
	
	for i in range(needekKeys - currentKeys):
		curKey = preload("res://UI/Keys/KeyEmpty/KeyEmpty.tscn").instance()
		$KeyBox.add_child(curKey)
		connect("delete_all_UI", curKey, "DeleteUI")
		pass
	pass