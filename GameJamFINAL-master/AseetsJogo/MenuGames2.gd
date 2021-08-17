extends Node2D


func _ready():
	Music.Baixar()
	Music.Game1_music()
	
	Global.get_buttons_from_scene(self)
	Controller.set_actual_button($Button)

func _on_CheckButton_toggled(pressed):
	if pressed == true:
		Music.Mute()
	else:
		Music.desMute()

##Bau
func _on_Button_pressed():
	$AnimationPlayer.play("Transição")
	yield($AnimationPlayer,"animation_finished")
	Global.choose_randomized_game_level(Global.allBauScenes)

##SAIR
func _on_Button2_pressed():
	get_tree().change_scene("res://Menu.tscn")

##SEGUNDO JOGO
func _on_TextureButton_pressed():
	get_tree().change_scene("res://AssetsMenu/JogoFrutas/Scene/1.tscn")

##ESQUERDA
func _on_TextureButton2_pressed():
	$AnimationPlayer.play("Pagesq")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene("res://MenuGames.tscn")
