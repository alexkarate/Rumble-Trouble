extends Node2D
signal delete_all_GFX

var worldX = 14
var worldY = 14


func _ready():
	position.y = get_viewport_rect().size.y - 20
	worldX = get_parent().levelX
	worldY = get_parent().levelY
	pass


func FloorGFXUpdate(var map):
	emit_signal("delete_all_GFX")
	var curFloor 
	var curYOffset = -(get_viewport_rect().size.y - 600) / 2
	for y in range(worldY + 1):
		var curXOffset = (get_viewport_rect().size.x - 600)/2
		for x in range(worldX + 1):
			if (map[int(x)][int(y)] == 1):
				curFloor = preload("res://Floors/Floor1/Floor1.tscn").instance()
				add_child(curFloor)
				curFloor.SetCoordinates(curXOffset, curYOffset)
				connect("delete_all_GFX", curFloor, "RemoveGFX")
			elif (map[int(x)][int(y)] == 2):
				curFloor = preload("res://Floors/Floor2/Floor2.tscn").instance()
				add_child(curFloor)
				curFloor.SetCoordinates(curXOffset, curYOffset)
				connect("delete_all_GFX", curFloor, "RemoveGFX")
				pass
			elif (map[int(x)][int(y)] == 3):
				curFloor = preload("res://Floors/FloorKey/FloorKey.tscn").instance()
				add_child(curFloor)
				curFloor.SetCoordinates(curXOffset, curYOffset)
				connect("delete_all_GFX", curFloor, "RemoveGFX")
				pass
			elif (map[int(x)][int(y)] == 4):
				curFloor = preload("res://Floors/FloorEnd/FloorEnd.tscn").instance()
				add_child(curFloor)
				curFloor.SetCoordinates(curXOffset, curYOffset)
				connect("delete_all_GFX", curFloor, "RemoveGFX")
				pass
			elif (map[int(x)][int(y)] == 5):
				curFloor = preload("res://Floors/Floor3/Floor3.tscn").instance()
				add_child(curFloor)
				curFloor.SetCoordinates(curXOffset, curYOffset)
				connect("delete_all_GFX", curFloor, "RemoveGFX")
				pass
			pass
			curXOffset = curXOffset + 40
		curYOffset = curYOffset - 40
		pass
	pass