extends Node2D


onready var pointsLabel = $Labels/noteLabel
onready var messageLabel = $Labels/messageLabel

var maxPoints = -1
var points = -1
var rate = -1

func _ready():
	maxPoints = Global.maxPoints
	points = Global.points
	set_points(points)
	set_message(points)
	set_color(points)

func set_points(value):
	print("##########RESULT SCREEN INFO##########")
	points = value
	
	pointsLabel.text = str(points) + " de " + str(maxPoints)
	
	print("points equal " + str(points))
	print("maxPoints equal " + str(maxPoints))
	
	if maxPoints!=0:
		rate = float((points * 100/maxPoints))
	
#	print("specific rate info = " + str(points) + " / " + str(maxPoints) + 
#	" * 100 ||" + " that equals " + str(float((points/maxPoints) * 100)))
	
	print("rate equals " + str(rate))

func set_message(points):
	
	if(maxPoints != 0):
		if rate == 100:
			messageLabel.text = "PERFEITO!"
			Music.Yea_music()
		elif rate >= 90:
			messageLabel.text = "MUITO BOM!"
			Music.Yea_music()
		elif rate >= 75:
			messageLabel.text = "BOM!"
			Music.Yea_music()
		elif rate >= 70:
			messageLabel.text = "RAZOÁVEL!"
			Music.Yea_music()
		elif rate >= 60:
			messageLabel.rect_position = Vector2(435, 251)
			messageLabel.text = "  PRECISA\nMELHORAR!"
			Music.Own_music()
		elif rate >= 40:
			messageLabel.rect_position = Vector2(435, 251)
			messageLabel.text = "  PRECISA\nMELHORAR!"
			Music.Own_music()
		elif rate >= 0:
			messageLabel.rect_position = Vector2(435, 251)
			messageLabel.text = "  PRECISA\nMELHORAR"
			Music.Own_music()

func set_color(points):
	if(maxPoints != 0):
		if rate >= 70:
			#Cor Verde = #17ee10
			pointsLabel.self_modulate = '17ee10'
			messageLabel.self_modulate = '17ee10'
		elif rate >= 0:
			#Cor Vermelha = #ae1b1b
			pointsLabel.self_modulate = 'ae1b1b'
			messageLabel.self_modulate = 'ae1b1b'


func _on_TextureButton_pressed():
	get_tree().change_scene("res://MenuGames.tscn")
