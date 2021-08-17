extends Node2D




func _ready():
	Global.get_buttons_from_scene(self)
	Controller.set_actual_button($"1")

func _on_10_pressed():
	Global.add_points(1)
	Error.Correct_music()
	$AnimationPlayer.play("Correct")
	yield($AnimationPlayer,"animation_finished")
	Global.choose_level()

func _on_TextureButton_pressed():
	get_tree().change_scene("res://MenuGames.tscn")


func _on_7_pressed():
	Error.Error_music()
	$AnimationPlayer.play("Erro")
	Global.add_points(-1)

func _on_8_pressed():
	Error.Error_music()
	$AnimationPlayer.play("Erro")
	Global.add_points(-1)

func _on_9_pressed():
	Error.Error_music()
	Global.add_points(-1)
	$AnimationPlayer.play("Erro")



