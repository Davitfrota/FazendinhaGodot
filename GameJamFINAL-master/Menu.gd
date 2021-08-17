extends Node2D

func _ready():
	Music.Baixar()
	
	Global.get_buttons_from_scene(self)
	
	Controller.set_actual_button($TextureButton)

func _on_CheckButton_toggled(pressed):
	if pressed == true:
		Music.Mute()
	else:
		Music.desMute()

func _on_TextureButton_pressed():
	$AnimationPlayer.play("Transição")


func _on_Button_pressed():
	get_tree().quit()




func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://MenuGames.tscn")
