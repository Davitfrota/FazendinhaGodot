extends Node

#FRUITGAME

var fruitOne = "res://AssetsMenu/JogoFrutas/Scene/1.tscn"
var fruitTwo = "res://AssetsMenu/JogoFrutas/Scene/2.tscn"
var fruitThree = "res://AssetsMenu/JogoFrutas/Scene/3.tscn"
var fruitFour = "res://AssetsMenu/JogoFrutas/Scene/4.tscn"
var fruitFive = "res://AssetsMenu/JogoFrutas/Scene/5.tscn"
var fruitSix = "res://AssetsMenu/JogoFrutas/Scene/6.tscn"
var fruitSeven = "res://AssetsMenu/JogoFrutas/Scene/7.tscn"
var fruitEight = "res://AssetsMenu/JogoFrutas/Scene/8.tscn"
var fruitNine = "res://AssetsMenu/JogoFrutas/Scene/9.tscn"
var fruitTen = "res://AssetsMenu/JogoFrutas/Scene/10.tscn"

var allFruitScenes = [fruitOne, fruitTwo, fruitThree, fruitFour, 
fruitFive, fruitSix, fruitSeven, fruitEight, fruitNine, fruitTen]


#CHESTGAME


var BauOne = "res://AssetsMenu/JogoBaú/ScenaBaú/jogoBaú.tscn"
var BauTwo = "res://AssetsMenu/JogoBaú/ScenaBaú/jogoBauQUa.tscn"
var BauThree = "res://AssetsMenu/JogoBaú/ScenaBaú/JogoBauTri.tscn"
var BauFour = "res://AssetsMenu/JogoBaú/ScenaBaú/JogoBauRetan.tscn"
var BauFive = "res://AssetsMenu/JogoBaú/ScenaBaú/JogoBauLoz.tscn"

var allBauScenes = [BauOne, BauTwo, BauThree, BauFour, BauFive]


#ANIMALGAME

var AnimalsOne = "res://Animais1.tscn"
var AnimalsTwo = "res://Animais2.tscn"
var AnimalsThree = "res://Animais3.tscn"
var AnimalsFour = "res://Animais4.tscn"
var AnimalsFive = "res://Animais5.tscn"
var AnimalsSix = "res://Animais6.tscn"

var allAnimalScenes = [AnimalsOne, AnimalsTwo, AnimalsThree, AnimalsFour, AnimalsFive, AnimalsSix]

#ESSENTIALS


	 #RANDOMIZE AND CHOOSE LEVELS


var randomizedArray = []

func choose_randomized_game_level(fruitArray):
	points = 0
	randomizedArray = []
	var cont = 0
	randomize()
	var randomNumbers = []
	
	while cont < len(fruitArray):
		randomize()
		var alreadyChoosed = false
		var randomNumber = randi()%len(fruitArray)-1+1
		
		
		for j in randomNumbers:
			if randomNumber == j:
				alreadyChoosed = true;
		
		if(!alreadyChoosed):
			randomNumbers.append(randomNumber)
		
		
		if !alreadyChoosed:
			randomizedArray.append(fruitArray[randomNumber])
			cont += 1
			#print("Element Added")
		else:
			pass
			#print("AC!")
			#print("Number Array = " + str(randomNumbers))
			#print("Number Choosed = " + str(randomNumber))
	
	if len(randomizedArray) > 0:
		maxPoints = len(randomizedArray)
		choose_level()
	else:
		print("Random Array with ZERO Elements");

func choose_level():
	if len(randomizedArray) == 0:
		get_tree().change_scene("res://Scenes/Maps/ResultScreen/resultScreen.tscn")
	else:
		var randomLevel = randomizedArray[randi()%len(randomizedArray)-1+0]
		randomizedArray.erase(randomLevel)
		print("##########LEVEL INFO###########")
		print("array_of_levels = " + str(randomizedArray))
		print("level choosed = " + str(randomLevel))
		get_tree().change_scene(randomLevel)


	 #POINTS


var maxPoints = 0
var points = 0



func add_points(valor):
	print("##########POINTS INFO###########")
	points += valor
	print("Added " + str(valor) + " to points.")
	
	if points < 0:
		points = 0
	
	if valor > 0:
		Socket.write_text("acertou\n")
	elif valor < 0:
		Socket.write_text("errou\n")
	
	print("Actual points equal = " + str(points))

func reset_points():
	points = 0

func set_points(valor):
	points = valor



	#BUTTONS AND CONTROLLER

var buttonsInScene = []

func button_focused(button):
	if is_instance_valid(button):
		button.modulate = Color(0, 0, 1)

func button_not_focused(button):
	if is_instance_valid(button):
		button.modulate = Color(1, 1, 1)

func send_button(button):
	buttonsInScene.append(button)

func get_buttons_from_scene(Scene):
	buttonsInScene = []
	
	var allChilds = Scene.get_children()
	print(allChilds)
	for i in allChilds:
		if i is TextureButton or i is Button:
			send_button(i)
			#print("Button Sended!")
	
	Controller.availableButtons = buttonsInScene
	#print("Buttons in scene = " + str(buttonsInScene))

func send_buttons_to_controller():
	pass























