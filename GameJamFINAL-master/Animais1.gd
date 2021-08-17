extends Node2D


func _ready():
	Global.get_buttons_from_scene(self)
	Controller.set_actual_button($vaca)


func _on_TextureButton_pressed():
	SonsAnimais.leao_Sound()


func _on_Sair_pressed():
	get_tree().change_scene("res://MenuGames.tscn")


func _on_bird_pressed():
	Global.add_points(1)
	Error.Correct_music()
	$AnimationPlayer.play("Correct")
	yield($AnimationPlayer,"animation_finished")
	Global.choose_level()


func _on_vaca_pressed():
	$AnimationPlayer.play("Erro")
	Error.Error_music()

func _on_Golf_pressed():
	$AnimationPlayer.play("Erro")
	Error.Error_music()

func _on_leao_pressed():
	$AnimationPlayer.play("Erro")
	Error.Error_music()
