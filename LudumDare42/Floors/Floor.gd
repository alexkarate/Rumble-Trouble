extends Sprite



func SetCoordinates(var x, var y):
	position.x = x
	position.y = y
	pass

func RemoveGFX():
	queue_free()
	pass
