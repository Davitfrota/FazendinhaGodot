extends Node2D

onready var animalButton = $Button
onready var fruitsButton = $TextureButton
onready var nextButton = $TextureButton2

func _ready():
	#print(self.get_children())
	Global.get_buttons_from_scene(self)
	
	Controller.set_actual_button(animalButton)

func _process(delta):
	pass

func _on_CheckButton_toggled(pressed):
	if pressed == true:
		Music.Mute()
	else:
		Music.desMute()


func _on_Button_pressed():
	$AnimationPlayer.play("Transição")
	yield($AnimationPlayer,"animation_finished")
	Global.choose_randomized_game_level(Global.allAnimalScenes)

func _on_Button2_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_TextureButton_pressed():
	$AnimationPlayer.play("Transição")
	yield($AnimationPlayer,"animation_finished")
	Global.choose_randomized_game_level(Global.allFruitScenes)

func _on_TextureButton2_pressed():
	$AnimationPlayer.play("Transição")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene("res://AseetsJogo/MenuGames2.tscn")
