extends Node2D

func _ready():
	Global.get_buttons_from_scene(self)
	Controller.set_actual_button($"1")

#FAZ OQ TÁ AQUI NAS OUTRAS CENAS \/\/\/\/\/\/

onready var animationPlayer = $AnimationPlayer

func _on_1_pressed():
	Global.add_points(1)
	Error.Correct_music()
	$AnimationPlayer.play("Correct")
	yield($AnimationPlayer,"animation_finished")
	Global.choose_level()

func _on_TextureButton_pressed():
	get_tree().change_scene("res://MenuGames.tscn")


func _on_2_pressed():
	$AnimationPlayer.play("Erro")
	Error.Error_music()
	Global.add_points(-1)

func _on_3_pressed():
	$AnimationPlayer.play("Erro")
	Error.Error_music()
	Global.add_points(-1)

func _on_4_pressed():
	$AnimationPlayer.play("Erro")
	Error.Error_music()
	Global.add_points(-1)
