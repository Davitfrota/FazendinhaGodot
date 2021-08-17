extends Node

var availableButtons = []
var actualButton = null

func _ready():
	Socket.connect("direita", self, "move_right")
	Socket.connect("esquerda", self, "move_left")
	Socket.connect("subir", self, "move_up")
	Socket.connect("descer", self, "move_down")
	pass

func _process(delta):
	
	move_through_buttons()
	
	if Input.is_action_just_pressed("ui_accept"):
		actualButton.emit_signal("pressed")
	
#	if(len(availableButtons) > 0):
#		print(availableButtons[0].rect_position)

func set_actual_button(button):
	actualButton = availableButtons[0]

func move_through_buttons():
	
	for i in availableButtons:
		if i != actualButton:
			Global.button_not_focused(i)
	
	Global.button_focused(actualButton)
	
	
	#Controle Move para Cima
	
	if Input.is_action_just_pressed("ControllerUp"):
		get_button_by_position("Y", "Up")
	
	#Controle Move para Baixo
	
	if Input.is_action_just_pressed("ControllerDown"):
		get_button_by_position("Y", "Down")
	
	#Controle Move para Esquerda
	
	if Input.is_action_just_pressed("ControllerLeft"):
		get_button_by_position("X", "Left")
	
	#Controle Move para Direita
	
	if Input.is_action_just_pressed("ControllerRight"):
		get_button_by_position("X", "Right")

func get_button_by_position(axis, way):
	var buttonFound = false
	var posMinDif = 15
	var posMaxDif = 5
	
	if is_instance_valid(actualButton):
		
		var closestX = 99999
		var closestY = 99999
		var nextButtonWithClosestX = null
		var nextButtonWithClosestY = null
		
		print("##########")
		print("Pos Before = " + str(actualButton.rect_position))
		
		
		
		for i in availableButtons:
			
			if(closestX == actualButton.rect_position.x and closestY == actualButton.rect_position.y):
				closestX = 99999
				closestY = 99999
			
			if i != actualButton and abs(actualButton.rect_position.x - i.rect_position.x) < closestX:
				closestX = i.rect_position.x
				nextButtonWithClosestX = i
				
			
			if i != actualButton and abs(actualButton.rect_position.y - i.rect_position.y) < closestY:
				closestY = i.rect_position.y
				nextButtonWithClosestY = i
		
		print("Closest X = " + str(closestX))
		print("Closest Y = " + str(closestY))
		
		if axis.to_lower() == "x":
			
			for i in availableButtons:
				
				if way.to_lower() == "left":
					print(">>>>>>>>>> Moving Left <<<<<<<<<<")
				
					if abs(i.rect_position.y - actualButton.rect_position.y) <= posMinDif and i.rect_position.x < actualButton.rect_position.x and actualButton.rect_position.x - i.rect_position.x >= posMaxDif:
						actualButton = i
						buttonFound = true
						break
					
#					elif i.rect_position.x < actualButton.rect_position.x and actualButton.rect_position.x - i.rect_position.x >= posMinDif:
#						actualButton = i
#						buttonFound = true
#						break
					
				elif way.to_lower() == "right":
					print(">>>>>>>>>> Moving Right <<<<<<<<<<")
				
					if abs(i.rect_position.y - actualButton.rect_position.y) <= posMinDif and i.rect_position.x > actualButton.rect_position.x and i.rect_position.x - actualButton.rect_position.x >= posMaxDif:
						actualButton = i
						buttonFound = true
						break
					
#					elif i.rect_position.x > actualButton.rect_position.x and i.rect_position.x - actualButton.rect_position.x >= posMinDif:
#						actualButton = i
#						buttonFound = true
#						break
					
				else:
					print("Invalid Way")
				
				if(buttonFound):
					break
				
				posMinDif *= 10
		
		elif axis.to_lower() == "y":
			
			for i in availableButtons:
				if way.to_lower() == "up":
					print(">>>>>>>>>> Moving Up <<<<<<<<<<")
					if abs(i.rect_position.x - actualButton.rect_position.x) <= posMinDif and i.rect_position.y < actualButton.rect_position.y and actualButton.rect_position.y - i.rect_position.y >= posMaxDif:
						actualButton = i
						buttonFound = true
						break
				elif way.to_lower() == "down":
					print(">>>>>>>>>> Moving Down <<<<<<<<<<")
					if abs(i.rect_position.x - actualButton.rect_position.x) <= posMinDif and i.rect_position.y > actualButton.rect_position.y and i.rect_position.y - actualButton.rect_position.y >= posMaxDif:
						actualButton = i
						buttonFound = true
						break
				else:
					print("Invalid Way")
				
				if(buttonFound):
					break
				
				posMinDif *= 10
		
		else:
			print("Invalid Axis")
		
		print("New Pos = " + str(actualButton.rect_position))
		
		print("All Buttons Positions: ")
		for i in availableButtons:
			print(i.rect_position)
		
		print("##########")



func move_right(player):
	get_button_by_position("x", "right")

func move_left(player):
	get_button_by_position("x", "left")

func move_up(player):
	get_button_by_position("y", "up")

func move_down(player):
	get_button_by_position("y", "down")















