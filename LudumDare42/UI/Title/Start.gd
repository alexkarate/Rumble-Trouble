extends Button


func _ready():
	connect("button_down", get_parent().get_parent().get_parent().get_parent().get_parent(), "StartGame")
	pass

