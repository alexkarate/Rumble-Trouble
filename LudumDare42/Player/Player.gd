extends Node2D
signal update_map
signal check_tile
export(float) var offsetX = 20
export(float) var offsetY = 20
var posX = 0
var posY = 0
var worldX
var worldY
var tween
var gameStarted

func _ready():
	connect("update_map", get_parent(), "UpdateMap")
	connect("check_tile", get_parent(), "CheckTile")
	worldX = get_parent().levelX
	worldY = get_parent().levelY
	offsetY = offsetY + (get_viewport_rect().size.y - 600) / 2
	offsetY = offsetY + (worldY * 40)
	offsetX = offsetX + ((get_viewport_rect().size.x - 600)/2)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if (gameStarted):
		if (event.is_action_pressed("ui_right") && posX < worldX): 
			emit_signal("update_map", posX, posY)
			posX = posX + 1
			emit_signal("check_tile", posX, posY)
			UpdatePosition(false)
			pass
		elif (event.is_action_pressed("ui_left") && posX > 0):
			emit_signal("update_map", posX, posY)
			posX = posX - 1
			emit_signal("check_tile", posX, posY)
			UpdatePosition(false)
			pass
		elif (event.is_action_pressed("ui_up") && posY < worldY):
			emit_signal("update_map", posX, posY)
			posY = posY + 1
			emit_signal("check_tile", posX, posY)
			UpdatePosition(false)
			pass
		elif (event.is_action_pressed("ui_down")&& posY > 0):
			emit_signal("update_map", posX, posY)
			posY = posY - 1
			emit_signal("check_tile", posX, posY)
			UpdatePosition(false)
			pass
		pass
	pass
	
func LevelStart(var x, var y, var map):
	gameStarted = true
	posX = x
	posY = y
	UpdatePosition(true)
	pass

func Teleport(var x, var y):
	posX = x
	posY = y
	UpdatePosition(true)
	pass

func EndGame():
	position.x = -2000
	position.y = 2000
	gameStarted = false
	pass

func UpdatePosition(var teleport):
	if (posX > worldX): posX = worldX
	if (posX < 0): posX = 0
	if (posY > worldY): posY = worldY
	if (posY < 0): posY = 0
	
	if(!teleport):
		tween = $Tween
		tween.interpolate_property(self, "position",
				Vector2(position.x, position.y), 
				Vector2((posX * 40) + offsetX, -(posY * 40) + offsetY), 
				0.1, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
		tween.start()
		pass
	else: 
		position.x = offsetX + (posX * 40)
		position.y = offsetY - (posY * 40)
		pass
	pass